require "brewery/version"

module Brewery
  class Refractometer
    attr_accessor :original_brix, :final_brix

    def initialize(args)
      @original_brix = args[:original_brix]
      @final_brix = args[:final_brix]
    end

    def specific_gravity
      1.000898 + (0.003859118*original_brix) + (0.00001370735*original_brix*original_brix) + (0.00000003742517*original_brix*original_brix*original_brix)
    end

    def final_gravity
      1.001843 - (0.002318474*original_brix) - (0.000007775*original_brix*original_brix) - (0.000000034*original_brix*original_brix*original_brix) + (0.00574*final_brix) + (0.00003344*final_brix*final_brix) + (0.000000086*final_brix*final_brix*final_brix) 
    end

    def index_of_refraction
      1.33302 + (0.001427193*final_brix) + (0.000005791157*final_brix*final_brix)
    end

    def alcohol_by_weight
      1017.5596 - (277.4*final_gravity) + index_of_refraction*((937.8135*index_of_refraction) - 1805.1228)
    end

    def alcohol_by_volume
      alcohol_by_weight*(final_gravity/0.794)
    end
  end
end
