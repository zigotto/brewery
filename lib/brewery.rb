require "brewery/version"
require "nokogiri"

module Brewery
  autoload :Refractometer, 'brewery/refractometer'
  autoload :Priming, 'brewery/priming'

  def self.guides(name)
    Brewery::Guides.const_get(name.capitalize).new
  end

  class Guides
    class Bjcp
      attr_accessor :styles

      def initialize
        file = File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'data', 'bjcp2008.xml'))
        xml = Nokogiri::XML(file)
        @styles = xml.css("[type='beer']").css('subcategory').map {|xml| Style.new(xml)}
      end
    end

    class Style
      STATS_METHODS = %w[og_low og_high fg_low fg_high ibu_low ibu_high srm_low srm_high abv_low abv_high]

      attr_accessor :id, :name

      def initialize(xml)
        @id   = xml.attr('id')
        @name = xml.css('name').text

        STATS_METHODS.each do |var|
          define_singleton_method var.to_sym do
            xml.css(var.gsub('_', ' ')).text.to_f
          end
        end
      end
    end
  end
end
