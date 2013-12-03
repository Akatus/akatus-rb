# akatus-rb

Client oficial de integração com Akatus em Ruby

[Documentação](https://connect.akatus.com) | [Sandbox](https://sandbox.akatus.com)


## Installation

akatus gem is available through [Rubygems](http://rubygems.org/gems/akatus-rb) and can be installed via:

```
$ gem install akatus-rb
```

or add it to your Gemfile like this:

```
gem 'akatus-rb', '~> 0.0.1'
```

and generate the config:

```
$ rails generate akatus:config
```

## Usage example


``` ruby
require "akatus-rb"

order = Akatus::Order.new(
  ...
)
transaction = Akatus::Transaction.process(order)

puts transaction.uuid 
# => 1234-abcd-9876abc

```
