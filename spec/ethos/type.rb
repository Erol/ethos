require 'ethos/type'
require 'ethos/entity'

scope '.cast' do
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
    expected = Hash[:a, 1]
    result = Ethos::Type.cast [:a, 1], Hash

    asserts(result) == expected
  end

  spec 'casts a value to a Array' do
    expected = Array[1, 2]
    result = Ethos::Type.cast [1, 2], Array

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

      attribute :value, type: Float
    end

    values = {value: 1}

    expected = Entity.new values
    result = Ethos::Type.cast values, Entity

    asserts(result).is_a? Entity
    asserts(result.value) == expected.value
  end
end
