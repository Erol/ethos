module Ethos
  module Entity
    module ClassMethods
      def attribute(attr, cast = nil)
        reader = :"#{attr}"
        writer = :"#{attr}="

        define_method reader do
          attributes[attr]
        end

        define_method writer do |value|
          attributes[attr] = value
        end
      end
    end

    def attributes
      @attributes
    end

    def self.prepended(base)
      base.extend ClassMethods
    end
  end
end
