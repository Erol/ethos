module Ethos
  class Collection
    def type=(type)
      @_type = type
    end

    def type
      @_type
    end

    def initialize(values)
      @_values = values
    end

    def size
      @_values.size
    end

    def [](index)
      memoize index do
        Ethos::Type.cast @_values[index], type
      end
    end

    def ==(other)
      return false unless other.is_a? self.class
      return false unless self.size == other.size

      not size.times.any? do |i|
        self[i] != other[i]
      end
    end

    private

    def memoized
      @_memoized ||= []
    end

    def memoize(index)
      return memoized[index] if memoized[index]

      memoized[index] = yield
    end

    def unmemoize(index)
      memoized[index] = nil
    end
  end
end
