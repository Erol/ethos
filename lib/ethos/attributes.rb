require 'ethos/type'

module Ethos
  class Attributes
    def schema
      @_schema
    end

    def current
      @_current ||= {}
    end

    def initialize(schema, values: {})
      @_schema = schema

      schema.defaults.each do |key, value|
        current[key] = value.is_a?(Proc) ? value.call : value
      end

      schema.attributes.keys.each do |key|
        if values.key? key
          current[key] = values[key]
        elsif values.key? String key
          current[key] = values[String key]
        end
      end
    end

    def [](key)
      memoize key do
        scheme = schema.attributes[key]
        value = current[key]

        type = scheme[:type]

        if value.nil?
          nothing = scheme[:nothing]

          value = nothing.is_a?(Proc) ? nothing.call : nothing
        end

        value = Ethos::Type.cast value, type

        scheme[:extensions].each do |extension|
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
