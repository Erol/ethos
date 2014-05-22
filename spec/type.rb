require 'ethos/type'

scope '.cast' do
  spec 'casts a value to a String' do
    expected = String 1
    result = Ethos::Type.cast 1, String

    assert result, :==, expected
  end
end
