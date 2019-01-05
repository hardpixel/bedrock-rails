module BedrockSass
  class Engine < ::Rails::Engine
    initializer 'bedrock_sass.assets.precompile', group: :all do |app|
      BedrockSass.assets_paths.each do |asset_path|
        app.config.assets.paths << asset_path
      end
    end
  end
end
