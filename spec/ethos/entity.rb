require 'ethos/entity'

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :value, Integer
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

      attribute :value, Integer, default: 1
    end
  end

  spec do
    entity = Entity.new

    asserts(entity.value) == 1
  end

  spec do
    entity = Entity.new value: 2

    asserts(entity.value) == 2
  end
end

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :value, Integer, default: '1'
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

      attribute :value, String do
        def extended?
          true
        end
      end
    end
  end

  spec do
    entity = Entity.new

    asserts(entity.value).extended?
  end
end

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :name, String
      attribute :parent, Entity
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

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :value, Integer
    end
  end

  spec do
    this = Entity.new value: 1
    that = Entity.new value: 1

    asserts(this) == that
  end

  spec do
    this = Entity.new value: 1
    that = Entity.new value: 2

    refutes(this) == that
  end
end
