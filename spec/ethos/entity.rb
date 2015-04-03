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

  spec do
    entity = Entity.new
    entity.attributes = {value: 1}

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

  spec do
    entity = Entity.new
    entity.attributes = {value: 2}

    asserts(entity.value) == 2
  end

  spec do
    entity = Entity.new
    entity.attributes = {}

    asserts(entity.value) == 1
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

  spec do
    entity = Entity.new value: '1'

    asserts(entity.value).extended?
  end

  spec do
    entity = Entity.new

    entity.value = '1'

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
      parent = Entity.new name: 'Parent'

      asserts(entity.parent) == parent
    end
  end
end

scope do
  setup do
    class Entity
      prepend Ethos::Entity

      attribute :name, String
      collection :children, Entity
    end
  end

  scope do
    define entity: -> { Entity.new }

    spec do
      asserts(entity.children.size) == 0
    end
  end

  scope do
    define entity: -> { Entity.new children: [{name: 'Child 1'}, {name: 'Child 2'}] }

    spec do
      asserts(entity.children.size) == 2
    end

    spec do
      child = Entity.new name: 'Child 1'

      asserts(entity.children[0]) == child
    end

    spec do
      child = Entity.new name: 'Child 2'

      asserts(entity.children[1]) == child
    end

    spec do
      names = []

      entity.children.each do |child|
        names << child.name
      end

      asserts(names) == ['Child 1', 'Child 2']
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
