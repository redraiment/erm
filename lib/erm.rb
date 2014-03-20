# ERM: Embedded Ruby Macro
# Write code that writes code

require "erubis"

require "erm/config"
require "erm/core"

module Erm
  @options = Erm.default_options.merge(Erm.config_options).merge(Erm.command_line_options)

  class << self
    def method_missing(name, *args, &block)
      key = name.to_s.sub(/\?$/, '')
      @options.has_key?(key) ? @options[key] : super
    end
  end
end

module Erubis
  class Context
    def include(fragment, params = nil)
      erm "#{Erm.includes}/#{fragment}.erm", params || {}
    end

    def defn(fn, &block)
      self.class.class_eval do
        define_method(fn, &block)
      end
    end
  end
end
