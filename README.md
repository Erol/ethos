[![Build Status](https://travis-ci.org/Erol/ethos.svg?branch=master)](https://travis-ci.org/Erol/ethos)
[![Code Climate Score](http://img.shields.io/codeclimate/github/Erol/ethos.svg?style=flat)](https://codeclimate.com/github/Erol/ethos)
[![Test Coverage](https://codeclimate.com/github/Erol/ethos/badges/coverage.svg)](https://codeclimate.com/github/Erol/ethos)

# Ethos

A fast and simple entity library for Ruby.

## Synopsis

```ruby
require 'ethos/entity'

class Category
  attribute :name, String
end

class Product
  attribute :category, Category
  attribute :name, String
  collection :tags, String
end

product = Product.new category: {name: 'Fruits'}, name: 'Apple', tags: %w(food fruit)
product.category.name   #=> "Fruits"
product.name            #=> "Apple"
product.tags            #=> ["food", "fruit"]
```

## Contributing

1. Fork it
2. Create your feature branch ( `git checkout -b my-new-feature` )
3. Create tests and make them pass ( `rake test` )
4. Commit your changes ( `git commit -am 'Added some feature'` )
5. Push to the branch ( `git push origin my-new-feature` )
6. Create a new Pull Request
