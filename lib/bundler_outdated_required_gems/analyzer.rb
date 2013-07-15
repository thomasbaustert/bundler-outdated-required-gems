module BundlerOutdatedRequiredGems

  class Analyzer

    def find_outdated_required_gems
      say "getting outdated gems via 'bundle outdated' ..."
      bundler_outdated_gems = extract_outdated_gems(bundle_outdated)
      say "found #{bundler_outdated_gems.size} gems:\n#{formatted_gem_line(bundler_outdated_gems)}" if debug?

      say "getting required gems from Gemfile ..."
      required_gem_names = Bundler.definition.current_dependencies.map(&:name)
      say "found #{required_gem_names.size} gems:\n#{required_gem_names.join("\n")}" if debug?

      outdated_and_required_gems = bundler_outdated_gems.select { |gem| required_gem_names.include?(gem.gem_name) }
      say "found #{outdated_and_required_gems.size} required and outdated gems (#{bundler_outdated_gems.size} outdated gems overall)."
      say "Gems to be updated:\n#{formatted_gem_line(outdated_and_required_gems)}"
    end

    def extract_outdated_gems(bundler_output)
      outdated_gems = []
      bundler_output.each_line do |line|
        if line.strip[0] == '*'
          # The regexp extract the following parts:
          # "  * coffee-script-source (1.6.1 > 1.3.3)"
          #    gemname: coffee-script-source
          # newversion: 1.6.1
          # oldversion: 1.3.3
          md = /\s+\*\s+(?<gemname>[\w-]+)\s+\((?<newversion>.+)\s+\>\s+(?<oldversion>.+)\).*/.match(line)

          outdated_gems << Gem.new(gem_name: md['gemname'],
                                   old_version: md['oldversion'],
                                   new_version: md['newversion'])
        end
      end

      outdated_gems
    end

    def formatted_gem_line(gems)
      gems.map { |gem| "#{gem.gem_name} (#{gem.new_version} > #{gem.old_version})" }.join("\n")
    end

    def bundle_outdated
      run("bundle outdated")
    end

    def run(command, options = {})
      `#{command}`
    end

    def say(msg)
      puts "-> #{msg}"
    end

    def debug?
      ENV['DEBUG']
    end
  end
end
