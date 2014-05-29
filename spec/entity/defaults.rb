require 'ethos/entity'

class EntityWithDefaultValue
  prepend Ethos::Entity

  attribute :name, String, default: 'Apple'
end

subject Ethos::Entity

scope '.attribute' do
  spec 'creates an attribute with a default value' do
    entity = EntityWithDefaultValue.new

    assert entity.name, :==, 'Apple'
  end
end

scope '.defaults' do
  spec 'returns all attributes with default values' do
    assert EntityWithDefaultValue.defaults, :==, {name: 'Apple'}
  end
end
