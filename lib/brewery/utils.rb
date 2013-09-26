module Brewery
  class Utils
    class << self
      def open_file(file)
        File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'data', file))
      end
    end
  end
end
