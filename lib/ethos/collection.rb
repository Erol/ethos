module Ethos
  class Collection
    def self.type=(type)
      @_type = type
    end

    def self.type
      @_type
    end
  end
end
