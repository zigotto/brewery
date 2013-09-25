module Brewery
  class Ingredient
    module InstanceMethods
      include Enumerable

      def initialize(name)
        self.file = Utils.open_file("#{name}.json").read
      end

      def each
        return to_enum unless block_given?

        @collection.each {|element| yield(Hashie::Mash.new(element)) }
      end

      private

      def file=(file)
        @collection = JSON.parse(file)["Ingredients"]
      end
    end

    class Fermentables
      include InstanceMethods
    end

    class Hops
      include InstanceMethods
    end

    class Yeasts
      include InstanceMethods
    end
  end
end
