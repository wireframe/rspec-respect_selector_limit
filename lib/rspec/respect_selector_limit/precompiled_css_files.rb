module PrecompiledCssFiles
  def precompiled_css_files
    app = Rails.application
    precompiled_assets = app.config.assets.precompile
    app.assets.each_logical_path(*precompiled_assets).to_a.grep(/\.css\z/)
  end
end

RSpec.configure do |config|
  config.include PrecompiledCssFiles
end
