require 'ethos/entity'

class Entity
  prepend Ethos::Entity

  attribute :name
end

subject Ethos::Entity

spec '.new allows no given attributes' do
  Entity.new
end

spec '.new assigns existing attributes' do
  entity = Entity.new name: 'Apple'

  assert entity.attributes[:name], :==, 'Apple'
end

spec '.new does not assign non-existing attributes' do
  entity = Entity.new none: 'None'

  refute entity.attributes[:none]
end

spec '.attribute creates an attribute getter' do
  entity = Entity.new name: 'Apple'

  assert entity.name, :==, 'Apple'
end

spec '.attribute creates an attribute setter' do
  entity = Entity.new
  entity.name = 'Apple'

  assert entity.name, :==, 'Apple'
end

spec '.attribute creates an attribute with no default value' do
  entity = Entity.new

  assert entity.name, :nil?
end
