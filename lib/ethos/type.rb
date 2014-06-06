require 'date'
require 'time'

module Ethos
  module Type
    CASTS = {
      nil => lambda { |value| value }
    }

    def self.define(type, &block)
      CASTS[type] = block
    end

    def self.cast(value, type)
      return value if value.is_a? type

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

Ethos::Type.define Date do |value|
  Date.parse value
end

Ethos::Type.define Time do |value|
  Time.parse value
end

Ethos::Type.define Hash do |values|
  Hash[*values]
end

Ethos::Type.define Array do |values|
  Array[*values]
end
