require "rubygems"

$:.unshift File.join(File.dirname(__FILE__), "lib")
require "erm/version"

Gem::Specification.new do |s|
  s.name = "erm"
  s.version = Erm::VERSION
  s.license = "MIT"

  s.summary = "Generate text file from templates."
  s.description = "It provides a tool like Jekyll to generate text file from templates rather than generate HTML from Markdown only."

  s.author = "Zhang, Zepeng"
  s.email = "redraiment@gmail.com"
  s.homepage = "https://github.com/redraiment/erm"

  s.files = ["README.md", "LICENSE", "bin/erm"] + Dir["lib/**/*.rb"]
  s.executables = ["erm"]
  s.default_executable = "bin/erm"

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[LICENSE]

  s.add_runtime_dependency "erubis"
end
