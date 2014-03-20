require "erubis"

class ErmEruby < Erubis::Eruby
  include Erubis::PrefixedLineEnhancer
  include Erubis::BiPatternEnhancer
end
