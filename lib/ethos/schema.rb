module Ethos
  class Schema
    def attributes
      @_attributes ||= {}
    end

    def defaults
      @_defaults ||= {}
    end

    def define(key, type, default: nil, extensions: [])
      attributes[key] = {
        type: type,
        default: default,
        extensions: extensions
      }

      defaults[key] = default if default
    end

    def defined?(key)
      attributes.key? key
    end
  end
end
