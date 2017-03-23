# workstation Cookbook

This is a personal cookbook for recreating my workstation from scratch.
Probably you will never need it.

## Requirements

### Platforms

Linux Mint. Ubuntu/Debian someday. May be Arch once.

### Chef

- Chef 12.0+

### Cookbooks

- `git`
- `php`
- `nvm`
- `rvm`
- `docker`
- `chrome`
- `chromedriver`
- `phantomjs2`

## Attributes


### workstation::default

TBD

| Key | Type | Description | Default |
|:----|:-----|:------------|:--------|

## Usage

### workstation::default

Gathers all other recipes and installs everything using them.

## Resources

### setup_workstation_chef

Installs additional gems for Chef DK that will be needed during cookbook 
development.

```ruby
setup_workstation_chef 'default' do
  gems %w(a b c) # defaults to node['workstation']['chef']['gems']
end
```

## Contributing

Just fork the repo and send pull request for dev branch.

## License and Authors

MIT License // Etki
