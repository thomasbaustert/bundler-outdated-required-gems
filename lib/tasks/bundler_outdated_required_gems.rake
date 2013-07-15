namespace :gems do
  namespace :outdated do

    desc "Print Gemfile's outdated gems"
    task :show => :environment do
      BundlerOutdatedRequiredGems::Analyzer.new.find_outdated_required_gems
    end

  end
end
