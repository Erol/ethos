require 'ethos/schema'
require 'ethos/attributes'

define schema: -> do
  schema = Ethos::Schema.new
  schema.define :value, Integer
  schema
end

scope do
  define attributes: -> { Ethos::Attributes.new schema }

  spec do
    asserts(attributes[:value]) == nil
  end

  spec do
    attributes[:value] = 1

    asserts(attributes[:value]) == 1
  end

  spec do
    attributes[:value] = '1'

    asserts(attributes[:value]) == 1
  end
end

scope do
  spec do
    attributes = Ethos::Attributes.new schema, values: {value: 1}

    asserts(attributes[:value]) == 1
  end

  spec do
    attributes = Ethos::Attributes.new schema, values: {value: '1'}

    asserts(attributes[:value]) == 1
  end
end
