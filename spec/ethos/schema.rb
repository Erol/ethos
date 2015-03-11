require 'ethos/schema'

define schema: -> { Ethos::Schema.new }

scope do
  setup do
    schema.define :value, Integer
  end

  spec do
    asserts(schema.attributes[:value]) == {type: Integer, default: nil, extensions: []}
  end

  spec do
    refutes(schema.defaults).key? :value
  end
end

scope do
  setup do
    schema.define :value, Integer, default: 1
  end

  spec do
    asserts(schema.attributes[:value]) == {type: Integer, default: 1, extensions: []}
  end

  spec do
    asserts(schema.defaults).key? :value
  end
end
