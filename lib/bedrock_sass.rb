require 'bedrock_sass/version'

module BedrockSass
  class << self
    def load!
      if rails?
        register_rails_engine
      elsif sprockets?
        register_sprockets
      elsif deprecated_sass?
        register_deprecated_sass
      end
    end

    def gem_path
      @gem_path ||= File.expand_path('..', File.dirname(__FILE__))
    end

    def stylesheets_path
      File.join(assets_path, 'bedrock', 'scss')
    end

    def javascripts_path
      File.join(assets_path, 'bedrock', 'js')
    end

    def assets_path
      @assets_path ||= File.join(gem_path, 'assets')
    end

    def vendor_path
      @vendor_path ||= File.join(assets_path, '_vendor')
    end

    def foundation_path
      @foundation_path ||= File.join(vendor_path, 'foundation', 'scss')
    end

    def motion_ui_path
      @motion_ui_path ||= File.join(vendor_path, 'motion-ui')
    end

    def tinymce_path
      @tinymce_path ||= File.join(vendor_path, 'tinymce')
    end

    def ace_path
      @ace_path ||= File.join(vendor_path, 'ace')
    end

    def yoastseo_path
      @yoastseo_path ||= File.join(vendor_path, 'yoastseo', 'css')
    end

    def assets_paths
      @assets_paths ||= [
        tinymce_path,
        ace_path,
        motion_ui_path,
        foundation_path,
        yoastseo_path,
        stylesheets_path,
        javascripts_path
      ]
    end

    def styles_paths
      @styles_paths ||= [
        motion_ui_path,
        yoastseo_path,
        foundation_path,
        stylesheets_path
      ]
    end

    def sprockets?
      defined?(::Sprockets)
    end

    def rails?
      defined?(::Rails)
    end

    def deprecated_sass?
      defined?(::Sass) && ::Sass.respond_to?(:load_paths)
    end

    private

    def register_rails_engine
      require 'bedrock_sass/engine'
    end

    def register_sprockets
      assets_paths.each do |asset_path|
        Sprockets.append_path(asset_path)
      end
    end

    def register_deprecated_sass
      styles_paths.each do |style_path|
        ::Sass.load_paths << style_path
      end
    end
  end
end

BedrockSass.load!
