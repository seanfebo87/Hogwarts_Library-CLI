
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Hogwarts/Library/CLI/version"

Gem::Specification.new do |spec|
  spec.name          = "Hogwarts-Library-CLI"
  spec.version       = Hogwarts::Library::CLI::VERSION
  spec.authors       = ["Sean Febo"]
  spec.email         = ["seanfebo@techie.com"]

  spec.summary       = %q{A gem..}
  spec.homepage      = "https://github.com/seanfebo87/Hogwarts_Library-CLI.git."
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = 'hogwarts'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
