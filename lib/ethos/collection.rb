module Ethos
  class Collection
    def self.type=(type)
      @_type = type
    end

    def self.type
      @_type
    end

    def initialize(values)
      @_values = values
    end

    def size
      @_values.size
    end
  end
end
