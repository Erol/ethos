[![Build Status](https://travis-ci.org/Erol/ethos.svg?branch=master)](https://travis-ci.org/Erol/ethos)
[![Code Climate Score](http://img.shields.io/codeclimate/github/Erol/ethos.svg?style=flat)](https://codeclimate.com/github/Erol/ethos)
[![Test Coverage](https://codeclimate.com/github/Erol/ethos/badges/coverage.svg)](https://codeclimate.com/github/Erol/ethos)

# Ethos

Ethos allows you to define attributes and collections on Ruby objects with options to specify type coercion and optional behavior. Though it is functionally similar to [Virtus](https://github.com/solnic/virtus), Ethos aims to be on par with the performance of [FastAttributes](https://github.com/applift/fast_attributes) in most use cases.

## Benchmarks

This is the performance comparison of Ethos with other popular gems: 

```
FastAttributes: without values                        :  2464641.1 i/s
FastAttributes: integer values for integer attributes :   119475.3 i/s - 20.63x slower
Ethos: without values                                 :   117166.5 i/s - 21.04x slower
FastAttributes: string values for integer attributes  :   104466.0 i/s - 23.59x slower
Ethos: integer values for integer attributes          :   101240.4 i/s - 24.34x slower
Ethos: string values for integer attributes           :    93084.0 i/s - 26.48x slower
Virtus: integer values for integer attributes         :    30740.4 i/s - 80.18x slower
Attrio: integer values for integer attributes         :    15532.0 i/s - 158.68x slower
Virtus: without values                                :    14978.0 i/s - 164.55x slower
Attrio: string values for integer attributes          :    14496.8 i/s - 170.01x slower
Attrio: without values                                :    10471.6 i/s - 235.36x slower
Virtus: string values for integer attributes          :     4299.1 i/s - 573.29x slower
```

## Contributing

1. Fork it
2. Create your feature branch ( `git checkout -b my-new-feature` )
3. Create tests and make them pass ( `rake test` )
4. Commit your changes ( `git commit -am 'Added some feature'` )
5. Push to the branch ( `git push origin my-new-feature` )
6. Create a new Pull Request
