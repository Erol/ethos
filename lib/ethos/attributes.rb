require 'ethos/type'

module Ethos
  class Attributes
    def schema
      @_schema
    end

    def initial
      @_initial ||= {}
    end

    def current
      @_current ||= {}
    end

    def initialize(schema, values: {})
      @_schema = schema

      schema.defaults.each do |key, value|
        initial[key] = value
        current[key] = value
      end

      schema.attributes.keys.each do |key|
        if values.key? key
          initial[key] = current[key] = values[key]
        elsif values.key? String key
          initial[key] = current[key] = values[String key]
        end
      end
    end

    def [](key)
      memoize key do
        value = Ethos::Type.cast current[key], schema.attributes[key][:type]

        schema.attributes[key][:extensions].each do |extension|
          value.instance_eval &extension
        end

        value
      end
    end

    def []=(key, value)
      unmemoize key

      current[key] = value
    end

    def ==(other)
      return false unless other.is_a? self.class

      not schema.attributes.keys.any? do |key|
        self[key] != other[key]
      end
    end

    private

    def memoized
      @_memoized ||= {}
    end

    def memoize(key)
      memoized.fetch key do
        memoized[key] = yield
      end
    end

    def unmemoize(key)
      memoized.delete key
    end
  end
end
