# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cfme_tools_services/version'

Gem::Specification.new do |spec|
  spec.name          = "cfme_tools_services"
  spec.version       = CfmeToolsServices::VERSION
  spec.authors       = ["Jason Frey"]
  spec.email         = ["jfrey@redhat.com"]
  spec.description   = %q{Shared services for internal CFME Tools and applications}
  spec.summary       = %q{Shared services for internal CFME Tools and applications}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -- lib/*`.split("\n")
  spec.files        += %w[README.md LICENSE.txt]
  spec.executables   = `git ls-files -- bin/*`.split("\n")
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
