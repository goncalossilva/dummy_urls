Gem::Specification.new do |gem|
  gem.name              = "dummy_urls"
  gem.version           = "0.9.1"
  gem.platform          = Gem::Platform::RUBY
  gem.authors           = ["Goncalo Silva"]
  gem.email             = ["goncalossilva@gmail.com"]
  gem.homepage          = "http://github.com/goncalossilva/dummy_urls"
  gem.summary           = "Generates dummy URLs for Rails 3 applications"
  gem.description       = "Generates dummy URLs to hit Rails 3 applications' routes. Since POST and PUT requests require more information than an URL, it uses dummy to generate appropriate data for these requests"
  gem.rubyforge_project = gem.name

  gem.required_rubygems_version = ">= 1.3.7"
  
  gem.add_dependency "dummy", ">= 0.9"
  gem.add_dependency "dummy_data", ">= 0.9"
  gem.add_dependency "rails", ">= 3.0.0.beta"

  gem.files        = Dir["{lib}/**/*.rb", "{lib}/**/*.yml", "LICENSE", "*.md"]
  
  gem.require_path = "lib"
end
