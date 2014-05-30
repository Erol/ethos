require 'ethos/entity'

class Entity
  prepend Ethos::Entity

  attribute :name, String
end

subject Ethos::Entity

scope '.attribute' do
  spec 'creates an attribute getter' do
    entity = Entity.new name: 'Apple'

    assert entity.name, :==, 'Apple'
  end

  spec 'creates an attribute setter' do
    entity = Entity.new
    entity.name = 'Apple'

    assert entity.name, :==, 'Apple'
  end

  spec 'creates an attribute with a given type' do
    entity = Entity.new name: 1

    assert entity.name, :==, '1'
    assert entity.name, :is_a?, String
  end
end

scope '.attributes' do
  spec 'returns all defined attributes' do
    assert Entity.attributes, :include?, :name
  end
end
