require "brewery/version"
require "nokogiri"

module Brewery
  autoload :Refractometer, 'brewery/refractometer'
  autoload :Priming, 'brewery/priming'

  def self.guides(name)
    Brewery::Guides.const_get(name.capitalize).new
  end

  class Guides
    class Bjpc
      attr_accessor :styles

      def initialize
        file = File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'data', 'bjcp2008.xml'))
        xml = Nokogiri::XML(file)
        @styles = xml.css("[type='beer']").css('subcategory').map {|xml| Style.new(xml)}
      end
    end

    class Style
      attr_accessor :name, :og, :fg, :ibu, :srm, :abv

      def initialize(xml)
        @name = xml.css('name').text

        @og = (xml.css('og low').text.to_f..xml.css('og high').text.to_f)
        @fg = (xml.css('fg low').text.to_f..xml.css('fg high').text.to_f)
        @ibu = (xml.css('ibu low').text.to_f..xml.css('ibu high').text.to_f)
        @srm = (xml.css('srm low').text.to_f..xml.css('srm high').text.to_f)
        @abv = (xml.css('abv low').text.to_f..xml.css('abv high').text.to_f)
      end
    end
  end
end
