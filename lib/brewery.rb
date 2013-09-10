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
  end
end
