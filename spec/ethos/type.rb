require 'ethos/type'
require 'ethos/entity'

scope '.cast' do
  scope 'casts a value to a Ethos::Types::Boolean' do
    spec do
      result = Ethos::Type.cast true, Ethos::Types::Boolean

      asserts(result).truthy?
    end

    spec do
      result = Ethos::Type.cast 1, Ethos::Types::Boolean

      asserts(result).truthy?
    end

    spec do
      result = Ethos::Type.cast false, Ethos::Types::Boolean

      asserts(result).falsey?
    end

    spec do
      result = Ethos::Type.cast nil, Ethos::Types::Boolean

      asserts(result).falsey?
    end
  end

  spec 'casts a value to a Symbol' do
    expected = :Symbol
    result = Ethos::Type.cast 'Symbol', Symbol

    asserts(result) == expected
  end

  spec 'casts a value to a String' do
    expected = String 1
    result = Ethos::Type.cast 1, String

    asserts(result) == expected
  end

  spec 'casts a value to an Integer' do
    expected = Integer 1
    result = Ethos::Type.cast 1, Integer

    asserts(result) == expected
  end

  spec 'casts a value to a Float' do
    expected = Float 1
    result = Ethos::Type.cast 1, Float

    asserts(result) == expected
  end

  spec 'casts a value to a Date' do
    expected = Date.parse '2014-01-01'
    result = Ethos::Type.cast '2014-01-01', Date

    asserts(result) == expected
  end

  spec 'casts a value to a Time' do
    expected = Time.parse '2014-01-01 12:00AM'
    result = Ethos::Type.cast '2014-01-01 12:00AM', Time

    asserts(result) == expected
  end

  spec 'casts a value to a DateTime' do
    expected = DateTime.parse '2014-01-01 12:00AM'
    result = Ethos::Type.cast '2014-01-01 12:00AM', DateTime

    asserts(result) == expected
  end

  spec 'casts a value to a Hash' do
    expected = {a: 1}
    result = Ethos::Type.cast [:a, 1], Hash

    asserts(result) == expected
  end

  spec 'casts a value to a Array' do
    values = {a: 1, b: 2}

    expected = [[:a, 1], [:b, 2]]
    result = Ethos::Type.cast values, Array

    asserts(result) == expected
  end

  spec 'casts a value to a BigDecimal' do
    expected = BigDecimal.new '10.10'
    result = Ethos::Type.cast 10.10, BigDecimal

    asserts(result) == expected
  end

  spec 'casts a hash of values to an Entity' do
    class Entity
      prepend Ethos::Entity

      attribute :value, Float
    end

    values = {value: 1}

    expected = Entity.new values
    result = Ethos::Type.cast values, Entity

    asserts(result).is_a? Entity
    asserts(result.value) == expected.value
  end

  spec 'casts to an instance of a type specified by a string' do
    expected = 1.0
    result = Ethos::Type.cast '1', 'Float'

    asserts(result) == expected
  end

  spec 'casts a nil' do
    class Entity
      prepend Ethos::Entity

      attribute :value, Float
    end

    expected = nil
    result = Ethos::Type.cast nil, Entity

    asserts(result) == expected
  end
end
