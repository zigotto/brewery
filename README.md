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

#### Refractometer

```ruby
american_ipa = Brewery.guides(:bjcp).find(id: '14B')

tool = Brewery.tools :refractometer do
  style american_ipa

  original_brix 17
  final_brix 7.5
end
```

You can search style by [ID](bjcp-categories.md)

```ruby
tool = Brewery.tools :refractometer do
  style '14B'

  original_brix 17
  final_brix 7.5
end
```

That's it!

```ruby
tool.original_gravity
# => 1.0706483000102098

tool.final_gravity
# => 1.0049822062500002

tool.alcohol_by_weight
# => 6.734352775327011

tool.alcohol_by_volume
# => 8.523809458203969
```

### Beer Style Guidelines

#### BJCP

```ruby
guide = Brewery.guides :bjcp
guide.styles
guide.categories

style = guide.find_style(id: '14B')
style.name
# => American IPA

category = guide.find_category(id: '14')
category.name
# => India Pale Ale(IPA)

category.styles
```

You can see the categories and styles [here](bjcp-categories.md)

#### Brewers Association (BA)

Comming soon.

### Ingredients

#### Fermentables

```ruby
fermentables = Brewery.ingredients :fermentables
fermentables.count
# => 187

fermentables.find_by_name('pale ale')
fermentables.find_by_description('alber malt')
fermentables.find_by_color('22.000')
fermentables.find_by_moisture('3.0')
fermentables.find_by_extract('80.0')
```

#### Hops

```ruby
hops = Brewery.ingredients :hops
hops.count
# => 85

hops.find_by_name('magnum')
hops.find_by_description('Australia')
hops.find_by_alpha('15.0')
```

#### Yeast

```ruby
yeasts = Brewery.ingredients :yeasts
yeasts.count
# => 208

yeasts.find_by_name('us-05')
yeasts.find_by_description('fermenting strain')
yeasts.find_by_yeast_type('liquid')
yeasts.find_by_beer_type('Ale')
yeasts.find_by_beer_attenuation('75.0')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
