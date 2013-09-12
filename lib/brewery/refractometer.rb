module Brewery
  class Refractometer
    def style(name = nil)
      if name
        @style = Brewery.guides(:bjcp).find(id: name)
      else
        g(:style)
      end
    end

    def original_brix(brix)
      @original_brix = brix
    end

    def final_brix(brix)
      @final_brix = brix
    end

    def original_gravity
      1.000898 + (0.003859118 * g(:original_brix)) +
        (0.00001370735 * g(:original_brix) * g(:original_brix)) +
        (0.00000003742517 * g(:original_brix) * g(:original_brix) * g(:original_brix))
    end

    def final_gravity
      1.001843 - (0.002318474 * g(:original_brix)) -
        (0.000007775 * g(:original_brix) * g(:original_brix)) -
        (0.000000034 * g(:original_brix) * g(:original_brix) * g(:original_brix)) +
        (0.00574 * g(:final_brix)) +
        (0.00003344 * g(:final_brix) * g(:final_brix)) +
        (0.000000086 * g(:final_brix) * g(:final_brix) * g(:final_brix))
    end

    def index_of_refraction
      1.33302 + (0.001427193 * g(:final_brix)) + (0.000005791157 * g(:final_brix) * g(:final_brix))
    end

    def alcohol_by_weight
      1017.5596 - (277.4 * final_gravity) + index_of_refraction * ((937.8135 * index_of_refraction) - 1805.1228)
    end

    def alcohol_by_volume
      alcohol_by_weight * (final_gravity/0.794)
    end

    private

    def g(name)
      instance_variable_get("@#{name}")
    end
  end
end
