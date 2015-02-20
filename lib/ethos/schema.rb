module Ethos
  class Schema
    def attributes
      @_attributes ||= {}
    end

    def defaults
      @_defaults ||= {}
    end

    def define(key, type, default: nil)
      attributes[key] = {
        type: type,
        default: default
      }

      defaults[key] = default if default
    end
  end
end
