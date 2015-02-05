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
