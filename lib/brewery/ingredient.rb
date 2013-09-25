module Brewery
  class Ingredient
    class Fermentables
      include Enumerable

      def initialize
        self.file = File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'data', 'fermentables.json')).read
      end

      def each
        return to_enum unless block_given?

        @collection.each {|element| yield(Hashie::Mash.new(element)) }
      end

      private

      def file=(file)
        @file = file
        @collection = JSON.parse(file)["Ingredients"]
      end
    end

    class Hops
      include Enumerable

      def initialize
        self.file = File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'data', 'hops.json')).read
      end

      def each
        return to_enum unless block_given?

        @collection.each {|element| yield(Hashie::Mash.new(element)) }
      end

      private

      def file=(file)
        @file = file
        @collection = JSON.parse(file)["Ingredients"]
      end
    end
  end
end
