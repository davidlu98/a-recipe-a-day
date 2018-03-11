# -*- encoding: utf-8 -*-
# stub: unirest 1.0.8 ruby lib

Gem::Specification.new do |s|
  s.name = "unirest".freeze
  s.version = "1.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mashape".freeze]
  s.date = "2013-04-23"
  s.description = "Unirest is a set of lightweight HTTP libraries available in PHP, Ruby, Python, Java, Objective-C.".freeze
  s.email = "support@mashape.com".freeze
  s.homepage = "https://unirest.io".freeze
  s.rubygems_version = "2.5.2.1".freeze
  s.summary = "Unirest, the lightweight HTTP library".freeze

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<addressable>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<addressable>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<addressable>.freeze, [">= 0"])
  end
end
