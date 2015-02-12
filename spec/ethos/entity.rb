require 'ethos/entity'

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :value, type: Integer
    end
  end

  spec do
    entity = Entity.new

    asserts(entity.value) == nil
  end

  spec do
    entity = Entity.new value: 1

    asserts(entity.value) == 1
  end

  spec do
    entity = Entity.new value: '1'

    asserts(entity.value) == 1
  end
end

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :value, type: Integer, default: 1
    end
  end

  spec do
    entity = Entity.new

    asserts(entity.value) == 1
  end
end

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :value, type: Integer, default: '1'
    end
  end

  spec do
    entity = Entity.new

    asserts(entity.value) == 1
  end
end

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :name, type: String
      attribute :parent, type: Entity
    end
  end

  scope do
    define entity: -> { Entity.new }

    spec do
      asserts(entity.parent) == nil
    end
  end

  scope do
    define entity: -> { Entity.new name: 'Child', parent: {name: 'Parent'} }

    spec do
      asserts(entity.parent).is_a? Entity
    end

    spec do
      asserts(entity.parent.name) == 'Parent'
    end
  end
end
