# Brewery

For now, some formulas and tools for Homebrewing.

## Installation

Add this line to your application's Gemfile:

    gem 'brewery'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brewery

## Usage

### Tools

Comming soon.

### Beer Style Guidelines

#### BJCP

```ruby
guide = Brewery.guides :bjcp
guide.styles

search = guide.find(id: '14B')
search.name
```

You can see the categories [here](bjcp-categories.md)

#### Brewers Association (BA)

Comming soon.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
