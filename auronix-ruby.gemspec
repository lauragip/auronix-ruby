require_relative "lib/auronix/ruby/version"
require 'auronix/version'

Gem::Specification.new do |spec|
  spec.name = "auronix-ruby"
  spec.version = Auronix::VERSION
  spec.authors = ["Fernando Ruiz"]
  spec.email = ["fernando.ruiz@hey.com"]

  spec.summary = "This is a Ruby library that allows interation with Auronix API"
  spec.homepage = "https://github.com/fruizg0302/auronix-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/fruizg0302/auronix-ruby/issues",
    "changelog_uri" => "https://github.com/fruizg0302/auronix-ruby/releases",
    "source_code_uri" => "https://github.com/fruizg0302/auronix-ruby",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[LICENSE.txt README.md {exe,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
