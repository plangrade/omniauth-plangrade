# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/plangrade/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-plangrade"
  spec.version       = Omniauth::Plangrade::VERSION
  spec.authors       = ["Christopher Reynoso"]
  spec.email         = ["topherreynoso@gmail.com"]
  spec.summary       = %q{Omniauth Strategy for plangrade}
  spec.description   = %q{Omniauth Strategy for plangrade. Find out more about the plangrade API at http://docs.plangrade.com}
  spec.homepage      = "https://github.com/topherreynoso/omniauth-plangrade"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
