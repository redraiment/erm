require "rubygems"

Gem::Specification.new do |s|
  s.name = "erm"
  s.summary = "Generate text file from templates."
  s.description = "It provides a tool like Jekyll to generate text file from templates (rather than generate HTML from Markdown)."
  s.version = "1.0.0"
  s.files = ["README", "bin/erm"]
  s.default_executable = "bin/erm"
  s.add_dependency "erubis"

  s.author = "Zhang, Zepeng"
  s.email = "redraiment@gmail.com"
  s.homepage = "https://github.com/redraiment/erm"
  s.license = "GPL 2"
end
