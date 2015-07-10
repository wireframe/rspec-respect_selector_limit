require 'rspec/expectations'
require 'css_parser'

RSpec::Matchers.define :respect_selector_limit do
  def max_selectors
    4095
  end

  def valid_asset?(asset)
    css = Rails.application.assets[asset].to_s

    parser = CssParser::Parser.new
    parser.add_block!(css)

    @count = 0
    parser.each_selector { @count += 1 }
    @count < max_selectors
  end

  match do |assets|
    @failed_assets = []
    Array(assets).each do |asset|
      @failed_assets << asset unless valid_asset?(asset)
    end

    @failed_assets.empty?
  end

  failure_message do |asset|
    "#{@failed_assets} have more than #{max_selectors} CSS selectors"
  end
end
