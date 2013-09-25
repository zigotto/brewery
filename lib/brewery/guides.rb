module Brewery
  class Guides
    class Bjcp
      attr_accessor :styles, :categories

      def initialize
        @categories = load_categories
        @styles     = load_styles
      end

      def find_style(id: nil)
        styles.find {|v| v.id == id}
      end
      alias :find :find_style

      def find_category(id: nil)
        categories.find {|v| v.id == id}
      end

      private

      def load_categories
        file.css('category').map {|xml| Category.new(xml) }
      end

      def load_styles
        file.css('subcategory').map {|xml| Style.new(xml) }
      end

      def file
        file = Utils.open_file('styleguide2008.xml')
        Nokogiri::XML(file).css("[type='beer']")
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

    class Category
      attr_accessor :id, :name, :styles

      def initialize(xml)
        @id   = xml.attr('id')
        @name = xml.css('name').first.text
        @styles = []

        xml.css('subcategory').each do |style|
          @styles << Style.new(style)
        end
      end
    end
  end
end
