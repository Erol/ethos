require 'ethos/type'

module Ethos
  module Entity
    module ClassMethods
      def attribute(attr, type, default: nil)
        reader = :"#{attr}"
        writer = :"#{attr}="

        define_method reader do
          attributes[attr] and Ethos::Type.cast attributes[attr], type
        end

        define_method writer do |value|
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
      @_attributes ||= {}
    end

    def self.prepended(base)
      base.extend ClassMethods
    end
  end
end
