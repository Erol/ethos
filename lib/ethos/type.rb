module Ethos
  module Type
    CASTS = {
      nil => lambda { |value| value }
    }

    def self.cast(value, type)
      CASTS[type][value]
    end
  end
end
