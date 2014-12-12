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
    alias :[]= :set

    def get(key)
      current[key]
    end
    alias :[] :get

    def ==(other)
      if other.is_a? Ethos::Attributes
        current == other.current
      elsif other.is_a? Hash
        current == other
      else
        raise TypeError, "#{other.class} can't be coerced into #{self.class}"
      end
    end

    def coerce(other)
      [self.class.new(other), self]
    end
  end
end
