# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dotenv-rails"
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Keepers"]
  s.date = "2013-08-29"
  s.description = "Autoload dotenv in Rails."
  s.email = ["brandon@opensoul.org"]
  s.homepage = "https://github.com/bkeepers/dotenv"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "Autoload dotenv in Rails."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dotenv>, ["= 0.9.0"])
    else
      s.add_dependency(%q<dotenv>, ["= 0.9.0"])
    end
  else
    s.add_dependency(%q<dotenv>, ["= 0.9.0"])
  end
end
