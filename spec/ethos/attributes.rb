require 'ethos/schema'
require 'ethos/attributes'

define schema: -> do
  schema = Ethos::Schema.new
  schema.define :value, type: Integer
  schema
end

spec do
  raises ArgumentError, 'missing keyword: schema' do
    Ethos::Attributes.new
  end
end

scope do
  define attributes: -> { Ethos::Attributes.new schema: schema }

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
    attributes = Ethos::Attributes.new schema: schema, values: {value: 1}

    asserts(attributes[:value]) == 1
  end

  spec do
    attributes = Ethos::Attributes.new schema: schema, values: {value: '1'}

    asserts(attributes[:value]) == 1
  end
end
