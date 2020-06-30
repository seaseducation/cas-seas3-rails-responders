$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "cas_seas3_rails_responders2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "cas_seas3_rails_responders2"
  spec.version     = CasSeas3RailsResponders2::VERSION
  spec.authors     = ["Scott Johnson"]
  spec.email       = ["scott.johnson@seaseducation.com"]
  spec.homepage      = "https://www.seaseducation.com/"
  spec.summary       = "Custom responders for our rails app"
  spec.description   = "Custom responders for our rails app based on the ones from the devise folks"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'rack', '~> 2.2.3'
  spec.add_dependency 'rails', ['>= 5', '< 6']
  spec.add_dependency 'responders', '~> 2.4.0'
  spec.add_dependency 'devise'
  spec.add_dependency 'nokogiri', '~> 1.10.4'
  spec.add_dependency 'omniauth', '~> 1.9.1'
  spec.add_dependency 'omniauth-twitter'

  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'sqlite3', '~> 1.3.13'
  spec.add_development_dependency 'activestorage'
  spec.add_development_dependency 'fabrication'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'kaminari'
end
