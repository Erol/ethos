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

    def changed
      @_changed ||= {}
    end

    def set(key, value)
      current[key] = value

      if initial[key] != value
        changed[key] = value
      else
        changed.delete key
      end
    end

    def get(key)
      current[key]
    end
  end
end
