module Ethos
  module Type
    CASTS = {
      String => lambda { |value| String value },
      nil => lambda { |value| value }
    }

    def self.cast(value, type)
      CASTS[type][value]
    end
  end
end
