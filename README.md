# NotBlank

Returns nil if the receiver is empty or blank.

Replace code like this:

```ruby
return a unless a.blank?
return b unless b.blank?
return c
```

with this:

```ruby
a.nb || b.nb || c
```

Replace code like this:

```ruby
arr = get_list_of_things.delete_if { |a| a.blank? }
arr.empty? ? nil : arr
```

with this:

```ruby
get_list_of_things.nb
```

Caution : this is not just a simple wrapper around `blank?` ; when the receiver is Enumerable, `nb`
returns a new Enumerable containing non-blank elements, or nil if there are no non-blank elements.
If the receiver is a Hash, `nb` returns a new hash containing only non-blank values, or nil if there
are no non-blank values. Hash#`nb` does not look at keys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'not_blank'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install not_blank

## Examples

See spec for more examples.

```ruby
"".nb       # => nil
" ".nb      # => nil
"\n".nb     # => nil
false.nb    # => nil
[""].nb     # => nil
[false].nb  # => nil
[false, true].nb # => [true]
{ a: nil, b: "", c: false, d: [[nil],[false], [""]] }.nb # => nil
```

## Dependency

This gem assumes you have a meaningful #blank? method defined for all objects of interest. ActionSupport

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/not_blank. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NotBlank project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/not_blank/blob/master/CODE_OF_CONDUCT.md).
