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

      values.each do |key, value|
        key = key.to_sym

        initial[key] = value
        current[key] = value
      end
    end

    def [](key)
      memoize key do
        current[key] and Ethos::Type.cast current[key], schema.attributes[key][:type]
      end
    end

    def []=(key, value)
      unmemoize key

      current[key] = value
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
