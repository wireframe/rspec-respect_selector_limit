# Rspec::RespectSelectorLimit
> Ensure your CSS files do not break in Old IE

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-respect_selector_limit'
```

## Usage

```ruby
require 'rails_helper'

it 'validates application.css' do
  expect('application.css').to respect_selector_limit
end

# advanced protip to scan all precompiled CSS files
it 'validates all CSS files' do
  css_files = Rails.application.assets.each_logical_path(*Rails.application.config.assets.precompile).to_a.grep(/\.css/)
  css_files.each do |file|
    expect(file).to respect_selector_limit
  end
end
```

## Contributing

1. Fork it ( https://github.com/wireframe/rspec-respect_selector_limit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
