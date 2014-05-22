require 'ethos/entity'

class Entity
  prepend Ethos::Entity

  attribute :name
end

class EntityWithDefault
  prepend Ethos::Entity

  attribute :name, default: 'Apple'
end

class EntityWithType
  prepend Ethos::Entity

  attribute :name, type: String
end

class EntityWithTypeAndDefault
  prepend Ethos::Entity

  attribute :name, type: String, default: 1
end

subject Ethos::Entity

scope '.new' do
  spec 'allows no given attributes' do
    Entity.new
  end

  spec 'assigns existing attributes' do
    entity = Entity.new name: 'Apple'

    assert entity.attributes[:name], :==, 'Apple'
  end

  spec 'does not assign non-existing attributes' do
    entity = Entity.new none: 'None'

    refute entity.attributes[:none]
  end
end

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

  spec 'creates an attribute with no default value' do
    entity = Entity.new

    assert entity.name, :nil?
  end

  spec 'creates an attribute with a default value' do
    entity = EntityWithDefault.new

    assert entity.name, :==, 'Apple'
  end

  spec 'creates an attribute with no given type' do
    entity = Entity.new name: 1

    assert entity.name, :==, 1
    assert entity.name, :is_a?, Integer
  end

  spec 'creates an attribute with a given type' do
    entity = EntityWithType.new name: 1

    assert entity.name, :==, '1'
    assert entity.name, :is_a?, String
  end

  spec 'creates an attribute with a given type and no default value' do
    entity = EntityWithType.new

    assert entity.name, :==, nil
  end

  spec 'creates an attribute with a given type and a default value' do
    entity = EntityWithTypeAndDefault.new

    assert entity.name, :==, '1'
    assert entity.name, :is_a?, String
  end
end

scope '.attributes' do
  spec 'returns all defined attributes' do
    assert Entity.attributes, :include?, :name
  end
end

scope '.defaults' do
  spec 'returns all default attributes' do
    assert EntityWithDefault.defaults, :==, {name: 'Apple'}
  end
end
