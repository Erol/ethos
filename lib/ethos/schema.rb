module Ethos
  class Schema
    def attributes
      @_attributes ||= {}
    end

    def keys
      attributes.keys
    end

    def defaults
      @_defaults ||= {}
    end

    def define(key, type, default: nil, nothing: nil, extensions: [])
      attributes[key] = {
        type: type,
        default: default,
        nothing: nothing,
        extensions: extensions
      }

      defaults[key] = default if default
    end

    def defined?(key)
      attributes.key? key
    end
  end
end
