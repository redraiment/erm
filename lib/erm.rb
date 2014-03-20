# ERM: Embedded Ruby Macro
# Write code that writes code

require "erm/version"
require "erm/config"
require "erm/core"

@options = Erm.default_options.merge(Erm.config_options).merge(Erm.command_line_options)
extend Erm::Core
