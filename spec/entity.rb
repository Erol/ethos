require 'ethos/entity'

class Entity
  prepend Ethos::Entity

  attribute :name, String
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
