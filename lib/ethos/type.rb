module Ethos
  module Type
    CASTS = {
      nil => lambda { |value| value }
    }

    def self.define(type, &block)
      CASTS[type] = block
    end

    def self.cast(value, type)
      CASTS[type][value]
    end
  end
end

Ethos::Type.define String do |value|
  String value
end

Ethos::Type.define Integer do |value|
  Integer value
end

Ethos::Type.define Float do |value|
  Float value
end
