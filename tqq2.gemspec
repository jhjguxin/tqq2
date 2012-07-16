$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tqq2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tqq2"
  s.version     = Tqq2::VERSION
  s.authors     = ["Francis Jiang"]
  s.email       = ["jhjguxin@gmail.com"]
  s.homepage    = "https://github.com/jhjguxin/tqq2"
  s.summary     = "A wrapper for 'open.t.qq.com' OAuth2 API"
  s.description = "A wrapper for 'open.t.qq.com' OAuth2 API"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  #s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "oauth2", "~> 0.5.1"

  s.add_development_dependency "rspec-rails"
end
