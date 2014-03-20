require "fileutils"
require "erubis"
require "yaml"

def clean
  FileUtils.rm_rf(Erm.destination) if Erm.clean? && File.exists?(Erm.destination)
end

def import(source, params = nil)
  params ||= {}
  content = ""

  loop do
    properties, fragment = File.read(source).split(/---$\n?/, 2)
    properties, fragment = "", (properties || "") if fragment.nil?
    content = fragment.gsub(/<%=\s*yield\s*%>/, content)
    params = (YAML.load(properties) || {}).merge(params)
    if params.has_key? "layout"
      layout = params.delete "layout"
      source = "#{Erm.layouts}/#{layout}.erm"
    else
      break
    end
  end

  return content, params
end

def render(erb, params)
  Erubis::Eruby.new(erb).evaluate(params)
end
