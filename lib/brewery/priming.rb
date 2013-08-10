module Brewery
  class Priming
    attr_accessor :radius, :height

    def initialize(args)
      @radius = args[:radius]
      @height = args[:height]
    end

    def volume_of_cylinder
      ((3.14 * @radius * @radius * @height) / 1000).round(3)
    end

    # TODO Config initializer to set the units
    #
    def total(args)
      gr = args[:sugar]
      sugar = (volume_of_cylinder * gr).round(3)
      water = sugar * 3
      return sugar, water
    end
  end
end
