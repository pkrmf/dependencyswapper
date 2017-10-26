# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dependencyswapper/version"

Gem::Specification.new do |spec|
  spec.name          = "dependencyswapper"
  spec.version       = Dependencyswapper::VERSION
  spec.authors       = ["Marc Terns"]
  spec.email         = ["tenxurz@gmail.com"]

  spec.summary       = "Swaps the cocoapods dependencies between a production environment and a test/development environment"
  spec.description   = "The dependencyswapper allows developers to switch between non source pods to source pods or to development pods. This gem comes very handy for framework developers that produce frameworks as binaries and not as source."
  spec.homepage      = "https://github.com/pkrmf/dependencyswapper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["depswapper", "setup"]
  spec.require_paths = ["lib"]
  spec.post_install_message = "Thanks for installing!"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "thor"
end
