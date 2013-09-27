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

      def method_missing(method, *args)
        if method.to_s =~ /^find_by_(.*)$/
          attr = $1.to_sym
          find_all {|i| i.send(attr) =~ /#{args.first}/i}
        else
          super
        end
      end

      def respond_to?(method, include_private = false)
        return true if method.to_s =~ /^find_by_(.*)$/
        super
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

    class Other
      include InstanceMethods
    end
  end
end
