module Ethos
  module Entity
    module ClassMethods
      def attribute(attr, options = {})
        reader = :"#{attr}"
        writer = :"#{attr}="

        define_method reader do
          attributes[attr]
        end

        define_method writer do |value|
          attributes[attr] = value
        end

        attributes << attr

        defaults[attr] = options[:default] if options[:default]
      end

      def attributes
        @_attributes ||= []
      end

      def defaults
        @_defaults ||= {}
      end
    end

    def initialize(attributes = {})
      self.class.defaults.merge(attributes).each do |k, v|
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
