require 'ethos/schema'
require 'ethos/attributes'

module Ethos
  module Entity
    module ClassMethods
      def schema
        @_schema ||= Ethos::Schema.new
      end

      def attribute(key, type, default: nil)
        schema.define key, type, default: default

        reader = :"#{key}"
        writer = :"#{key}="

        define_method reader do
          attributes[key]
        end

        define_method writer do |value|
          attributes[key] = value
        end
      end
    end

    def self.prepended(base)
      base.extend ClassMethods
    end

    def initialize(values = {})
      @_attributes = Ethos::Attributes.new self.class.schema, values: values

      super()
    end

    def attributes
      @_attributes
    end
  end
end
