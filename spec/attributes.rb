require 'ethos/attributes'

subject Ethos::Attributes

scope '.new' do
  spec 'assigns initial attribute values' do |example|
    attributes = Ethos::Attributes.new name: 'Apple'

    assert attributes.initial, :==, name: 'Apple'
  end

  spec 'assigns current attribute values' do
    attributes = Ethos::Attributes.new name: 'Apple'

    assert attributes.current, :==, name: 'Apple'
  end
end

scope '#set' do
  spec 'skips the initial attribute value' do
    attributes = Ethos::Attributes.new name: 'Apple'
    attributes.set :name, 'Banana'

    assert attributes.initial[:name], :==, 'Apple'
  end

  spec 'sets the current attribute value' do
    attributes = Ethos::Attributes.new name: 'Apple'
    attributes.set :name, 'Banana'

    assert attributes.current[:name], :==, 'Banana'
  end
end

scope '#get' do
  spec 'gets the current attribute value' do
    attributes = Ethos::Attributes.new name: 'Apple'
    attributes.set :name, 'Banana'

    value = attributes.get :name

    assert value, :==, 'Banana'
  end
end

scope '#initial' do
  spec 'returns initial attribute values' do
    attributes = Ethos::Attributes.new name: 'Apple'
    attributes.set :name, 'Banana'

    assert attributes.initial, :==, name: 'Apple'
  end
end

scope '#current' do
  spec 'returns current attribute values' do
    attributes = Ethos::Attributes.new name: 'Apple'
    attributes.set :name, 'Banana'

    assert attributes.current, :==, name: 'Banana'
  end
end

scope '#changed' do
  spec 'returns changed attribute values' do
    attributes = Ethos::Attributes.new a: 1, b: 2, c: 3
    attributes.set :a, 2
    attributes.set :b, 1

    assert attributes.changed, :==, a: 2, b: 1
  end
end
