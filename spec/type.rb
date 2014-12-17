require 'ethos/type'

scope '.cast' do
  spec 'casts a value to a Symbol' do
    expected = :Symbol
    result = Ethos::Type.cast 'Symbol', Symbol

    assert result, :==, expected
  end

  spec 'casts a value to a String' do
    expected = String 1
    result = Ethos::Type.cast 1, String

    assert result, :==, expected
  end

  spec 'casts a value to an Integer' do
    expected = Integer 1
    result = Ethos::Type.cast 1, Integer

    assert result, :==, expected
  end

  spec 'casts a value to a Float' do
    expected = Float 1
    result = Ethos::Type.cast 1, Float

    assert result, :==, expected
  end

  spec 'casts a value to a Date' do
    expected = Date.parse '2014-01-01'
    result = Ethos::Type.cast '2014-01-01', Date

    assert result, :==, expected
  end

  spec 'casts a value to a Time' do
    expected = Time.parse '2014-01-01 12:00AM'
    result = Ethos::Type.cast '2014-01-01 12:00AM', Time

    assert result, :==, expected
  end

  spec 'casts a value to a DateTime' do
    expected = DateTime.parse '2014-01-01 12:00AM'
    result = Ethos::Type.cast '2014-01-01 12:00AM', DateTime

    assert result, :==, expected
  end

  spec 'casts a value to a Hash' do
    expected = Hash[:a, 1]
    result = Ethos::Type.cast [:a, 1], Hash

    assert result, :==, expected
  end

  spec 'casts a value to a Array' do
    expected = Array[1, 2]
    result = Ethos::Type.cast [1, 2], Array

    assert result, :==, expected
  end

  spec 'casts a value to a BigDecimal' do
    expected = BigDecimal.new '10.10'
    result = Ethos::Type.cast 10.10, BigDecimal

    assert result, :==, expected
  end
end
