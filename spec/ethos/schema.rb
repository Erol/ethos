require 'ethos/schema'

define schema: -> { Ethos::Schema.new }

spec do
  raises ArgumentError, 'missing keyword: type' do
    schema.define :value
  end
end

scope do
  setup do
    schema.define :value, type: Integer
  end

  spec do
    asserts(schema.attributes[:value]) == {type: Integer, default: nil}
  end

  spec do
    refutes(schema.defaults).key? :value
  end
end

scope do
  setup do
    schema.define :value, type: Integer, default: 1
  end

  spec do
    asserts(schema.attributes[:value]) == {type: Integer, default: 1}
  end

  spec do
    asserts(schema.defaults).key? :value
  end
end
