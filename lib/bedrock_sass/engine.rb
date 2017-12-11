module BedrockSass
  class Engine < ::Rails::Engine
    initializer 'bedrock_sass.assets.precompile', group: :all do |app|
      app.config.assets.paths << root.join('assets', 'bedrock').to_s
      app.config.assets.paths << root.join('assets', '_vendor').to_s
    end
  end
end
