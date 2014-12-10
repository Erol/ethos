module Ethos
  class Attributes
    def initialize(attributes = {})
      attributes.each do |key, value|
        initial[key] = value
        current[key] = value
      end
    end

    def initial
      @_initial ||= {}
    end

    def current
      @_current ||= {}
    end

    def set(key, value)
      current[key] = value
    end

    def get(key)
      current[key]
    end
  end
end
