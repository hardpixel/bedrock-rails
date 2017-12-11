require 'bedrock_sass/engine'
require 'bedrock_sass/version'

module BedrockSass
  class << self
    def load!
      register_sprockets
      configure_sass
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

    private

      def configure_sass
        require 'sass'

        ::Sass.load_paths << motion_ui_path
        ::Sass.load_paths << foundation_path
        ::Sass.load_paths << stylesheets_path
      end

      def register_sprockets
        Sprockets.append_path(tinymce_path)
        Sprockets.append_path(motion_ui_path)
        Sprockets.append_path(foundation_path)
        Sprockets.append_path(stylesheets_path)
        Sprockets.append_path(javascripts_path)
      end
  end
end

BedrockSass.load!
