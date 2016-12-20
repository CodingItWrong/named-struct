# Ruby Template

Implements a `NamedStruct` that works just like `Struct` but with named
initializer parameters.

## Usage

```ruby
Person = NamedStruct.new(:first, :last)
josh = Person.new(first: 'Josh', last: 'Justice')
```

## Contributing

Code and documentation contributions are welcome! To contribute:

1. Fork the project ( http://github.com/CodingItWrong/GEMFILE/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License

MIT. See `LICENSE.txt` for details.
