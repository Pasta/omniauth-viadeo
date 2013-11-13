# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-viadeo/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-viadeo"
  s.version     = Omniauth::Viadeo::VERSION
  s.authors     = ["Vincent Coste"]
  s.email       = ["coste.vincent@gmail.com"]
  s.homepage    = "https://github.com/pasta/omniauth-viadeo"
  s.summary     = %q{Viadeo strategy for OmniAuth.}
  s.description = %q{Viadeo strategy for OmniAuth.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth2', '>= 1.0.0'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rack-test'
end
