require "optparse"
require "yaml"

require "erm/version"

module Erm
  CONFIG_FILE = "config.yml"

  def self.default_options
    {
      "clean" => false,
      "verbose" => false,
      "source" => "src",
      "destination" => "dest",
      "layouts" => "layouts",
      "includes" => "includes"
    }
  end

  def self.config_options
    File.exists?(CONFIG_FILE) ? YAML.load(File.read(CONFIG_FILE)) : {}
  end

  def self.command_line_parser
    defaults = default_options
    OptionParser.new do |o|
      o.banner = "Usage: erm [options]"
      o.separator "Options"
      o.on("-s", "--source DIR", "Source directory (defaults to ./#{defaults['source']})") do |source|
        @cmd_options['source'] = source.sub(/[\/\\]$/, '')
      end
      o.on("-d", "--destination DIR", "Destination directory (defaults to ./#{defaults['destination']})") do |destination|
        @cmd_options['destination'] = destination
      end
      o.on("-l", "--layouts DIR", "Layouts directory (defaults to ./#{defaults['layouts']})") do |layouts|
        @cmd_options['layouts'] = layouts
      end
      o.on("-i", "--includes DIR", "Includes directory (defaults to ./#{defaults['includes']})") do |includes|
        @cmd_options['includes'] = includes
      end
      o.on("-c", "--clean", "Clean destination directory before process") do
        @cmd_options['clean'] = true
      end
      o.on("-t", "--verbose", "Have erm give more verbose output") do
        @cmd_options['verbose'] = true
      end
      o.on("-h", "--help", "Display help documentation") do
        puts o
        exit
      end
      o.on("-v", "--version", "Display version information") do
        puts Erm::VERSION
        exit
      end
    end
  end
  private_class_method :command_line_parser

  def self.command_line_options
    if @cmd_options.nil?
      @cmd_options = {}
      parser = command_line_parser
      parser.parse!
    end
    @cmd_options
  end
end
