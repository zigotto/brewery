require "brewery/version"
require "nokogiri"

module Brewery
  autoload :Refractometer,  'brewery/refractometer'
  autoload :Priming,        'brewery/priming'
  autoload :Guides,         'brewery/guides'

  class << self
    def guides(name)
      Brewery::Guides.const_get(name.capitalize).new
    end

    def tools(name, &block)
      tool = Brewery.const_get(name.capitalize).new
      tool.instance_eval(&block)
      tool
    end
  end
end
