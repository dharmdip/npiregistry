# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'npiregistry/version'

Gem::Specification.new do |spec|
  spec.name          = "npiregistry"
  spec.version       = Npiregistry::VERSION
  spec.authors       = ["Dharmdip Rathod"]
  spec.email         = ["dharmdip.rathod@gmail.com"]

  spec.summary       = %q{A Ruby interface to the NPI registry API | Read Only (https://npiregistry.cms.hhs.gov/).}
  spec.description   = %q{For more details please review https://npiregistry.cms.hhs.gov/registry/help-api}
  spec.homepage      = "https://github.com/dharmdip/npiregistry"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'json', '>= 1.8.0'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

end
