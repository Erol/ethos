require 'ethos/entity'

class Entity
  prepend Ethos::Entity

  attribute :name
end

subject Ethos::Entity

spec '.new assigns existing attributes' do
  entity = Entity.new name: 'Apple'

  assert entity.attributes[:name], :==, 'Apple'
end

spec '.new does not assign non-existing attributes' do
  entity = Entity.new none: 'None'

  refute entity.attributes[:none]
end
