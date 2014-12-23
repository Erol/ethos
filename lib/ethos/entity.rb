require 'ethos/type'
require 'ethos/attributes'

module Ethos
  module Entity
    module ClassMethods
      def attribute(attr, type, default: nil)
        reader = :"#{attr}"
        writer = :"#{attr}="

        define_method reader do
          memoize attr do
            attributes[attr] and Ethos::Type.cast attributes[attr], type
          end
        end

        define_method writer do |value|
          unmemoize attr

          attributes[attr] = value
        end

        attributes[attr] = {type: type}
        attributes[attr][:default] = default if default

        defaults[attr] = default if default
      end

      def attributes
        @_attributes ||= {}
      end

      def defaults
        @_defaults ||= {}
      end
    end

    def initialize(attributes = {})
      self.class.defaults.merge(attributes).each do |k, v|
        v = v.call if v.is_a? Proc

        send :"#{k}=", v if respond_to? k
      end

      super()
    end

    def attributes
      @_attributes ||= Ethos::Attributes.new
    end

    def ==(other)
      return false if self.class != other.class

      self.class.attributes.keys.each do |key|
        return false if self[key] != other[key]
      end
    end

    def self.prepended(base)
      base.extend ClassMethods
    end

    private

    def memoized
      @_memoized ||= {}
    end

    def memoize(key)
      return memoized[key] if memoized.include? key

      memoized[key] = yield
    end

    def unmemoize(key)
      memoized.delete key
    end
  end
end
