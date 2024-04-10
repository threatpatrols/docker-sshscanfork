$: << "lib"
require 'ssh_scan/version'
require 'date'

Gem::Specification.new do |s|
  s.name = 'ssh_scan'
  s.version = SSHScan::VERSION
  s.authors = ["Jonathan Claudius", "Jinank Jain", "Harsh Vardhan", "Rishabh Saxena", "Ashish Gaurav"]
  s.date = Date.today.to_s
  s.email = 'jclaudius@mozilla.com'
  s.platform = Gem::Platform::RUBY
  s.files = Dir.glob("lib/**/*") +
            Dir.glob("bin/**/*") +
            Dir.glob("config/**/*") +
            Dir.glob("data/**/*") +
            Dir.glob("policies/**/*") +
            [".gitignore",
             ".rspec",
             ".travis.yml",
             "CONTRIBUTING.md",
             "Gemfile",
             "Rakefile",
             "README.md",
             "ssh_scan.gemspec"]
  s.license       = "ruby"
  s.require_paths = ["lib"]
  s.executables   = s.files.grep(%r{^bin/[^\/]+$}) { |f| File.basename(f) }
  s.summary = 'Ruby-based SSH Scanner'
  s.description = 'A Ruby-based SSH scanner for configuration and policy scanning'
  s.homepage = 'http://rubygems.org/gems/ssh_scan'
  s.metadata["yard.run"] = "yri" # use "yard" to build full HTML docs

  s.add_dependency("bindata", ">= 2.4")
  s.add_dependency("netaddr", ">= 2.0")
  s.add_dependency("net-ssh", ">= 7.2")
  s.add_dependency("ed25519", ">= 1.3")
  s.add_dependency("bcrypt_pbkdf", ">= 1.1")
  s.add_dependency("sshkey")
  s.add_development_dependency("pry", ">= 0.14")
  s.add_development_dependency("rspec", ">= 3.13")
  s.add_development_dependency("rspec-its", ">= 1.3")
  s.add_development_dependency "rake", ">= 13.2"
  s.add_development_dependency("rubocop")
end
