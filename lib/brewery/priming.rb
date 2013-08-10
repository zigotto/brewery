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

    def total_of_sugar(args)
      gr = args[:gr]
      (volume_of_cylinder * gr).round(3)
    end
  end
end
