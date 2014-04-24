# silent

[![Build Status](https://img.shields.io/travis/bfontaine/silent.svg)](https://travis-ci.org/bfontaine/silent)
[![Gem Version](https://img.shields.io/gem/v/silent.png)](http://badge.fury.io/rb/silent)
[![Coverage Status](https://img.shields.io/coveralls/bfontaine/silent.svg)](https://coveralls.io/r/bfontaine/silent)
[![Dependency Status](https://img.shields.io/gemnasium/bfontaine/silent.svg)](https://gemnasium.com/bfontaine/silent)

**silent** is a Ruby gem to silently execute a piece of code, that is without
any visible output.

## Install

```
gem install silent
```

## Usage

```rb
require 'silent'

silent(:stdout) do
  puts "this will never be displayed"
end

silent(:stderr) do
  # do bad things without apparent warnings
  ARGV = 42
end

silent(:stdout, :stderr) do
  puts "Everything is silent here"
  $stderr.write "is anyone listening to me?"
end
```

## Tests

```
$ git clone https://github.com/bfontaine/silent.git
$ cd silent
$ bundle install
$ bundle exec rake test
```
