# Npiregistry

A Ruby interface to the NPI registry API | Read Only (https://npiregistry.cms.hhs.gov)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'npiregistry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install npiregistry

## Usage

Get details using valid NPI number

```ruby
Npiregistry.get({number: 1245319599})
```

Get details using first name and wildcard search 

```ruby
Npiregistry.get({first_name: 'LAURA'})
```

or

```ruby
Npiregistry.get({first_name: '*URA'}) 
```

Get details using last name and wildcard search
```ruby
Npiregistry.get({last_name: 'SAMPLE'})
```

or

```ruby
Npiregistry.get({last_name: 'SAM*'}) 
```
 
Use the following fields to generating valid response.


| Fields         |  Description  |  
| :------------- |:-------------|
| number                |  Exactly 10 digits
| enumeration_type      |  NPI-1 or NPI-2 (Other criteria required)    
| taxonomy_description  |  Exact Description or Exact Specialty or wildcard * after 2 characters
| first_name            |  Exact name, or wildcard * after 2 characters    Use for type 1
| last_name             |  Exact name, or wildcard * after 2 characters    Use for type 1
| organization_name     |  Exact name, or wildcard * after 2 characters    Use for type 2
| address_purpose       |  LOCATION or MAILING (Other criteria required)
| city                  |  Exact Name
| state                 |  2 Characters (Other criteria required)
| postal_code           |  At least 2 characters, wildcard is implied
| country_code          |  Exactly 2 characters (if "US", other criteria required)
| limit                 |  Limit results, default = 10, max = 200
| skip                  |  Skip first N results, max = 1000




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/npiregistry. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

