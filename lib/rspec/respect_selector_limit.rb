require 'rspec/expectations'
require 'css_parser'

RSpec::Matchers.define :respect_selector_limit do
  def max_selectors
    4095
  end

  match do |asset|
    css = Rails.application.assets[asset].body

    parser = CssParser::Parser.new
    parser.add_block!(css)

    @count = 0
    parser.each_selector { @count += 1 }
    @count < max_selectors
  end

  failure_message do |asset|
    "expected #{asset} to have less than #{max_selectors} css selectors but had #{@count}"
  end
end
