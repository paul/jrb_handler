
module JrbHandler

end

unless respond_to?(:require_relative)
  # Ripped right from 1.9 source
  def require_relative(path)
    require File.join(File.dirname(caller[0]), path.to_str)
  end
end

require_relative 'jrb_handler/template_handler'
require_relative 'jrb_handler/jrb_partial_renderer'
require_relative 'jrb_handler/renderers'



