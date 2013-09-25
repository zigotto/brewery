require "brewery/version"
require "nokogiri"
require 'json'
require 'hashie'

module Brewery
  autoload :Refractometer,  'brewery/refractometer'
  autoload :Priming,        'brewery/priming'
  autoload :Guides,         'brewery/guides'
  autoload :Ingredient,     'brewery/ingredient'

  class << self
    def guides(name)
      Brewery::Guides.const_get(name.capitalize).new
    end

    def tools(name, &block)
      tool = Brewery.const_get(name.capitalize).new
      tool.instance_eval(&block)
      tool
    end

    def ingredients(name)
      Brewery::Ingredient.const_get(name.capitalize).new
    end
  end
end
