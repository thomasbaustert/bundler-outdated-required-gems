# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler_outdated_required_gems/version'

Gem::Specification.new do |spec|
  spec.name          = "bundler-outdated-required-gems"
  spec.version       = BundlerOutdatedRequiredGems::VERSION
  spec.authors       = ["Thomas Baustert"]
  spec.email         = ["business@thomasbaustert.de"]
  spec.description   = %q{Rake task to show outdated and required gems of bundler's Gemfile.}
  spec.summary       = %q{Rake task to show outdated and required gems of bundler's Gemfile.}
  spec.homepage      = "https://github.com/thomasbaustert/bundler-outdated-required-gems"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'highline'
end
