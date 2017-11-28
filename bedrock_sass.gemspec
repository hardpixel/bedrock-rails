# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bedrock_sass/version'

Gem::Specification.new do |spec|
  spec.name          = 'bedrock_sass'
  spec.version       = BedrockSass::VERSION
  spec.authors       = ['Jonian Guveli']
  spec.email         = ['jonian@hardpixel.eu']
  spec.summary       = %q{Bedrock Admin HTML framework}
  spec.description   = %q{Adds Bedrock Admin HTML framework, based on Zurb Foundation 6, into assets path.}
  spec.homepage      = 'https://github.com/hardpixel/bedrock-sass'
  spec.license       = 'MIT'
  spec.files         = Dir['{lib/**/*,[A-Z]*}']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib', 'assets']

  spec.add_dependency 'sass', '~> 3.4'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
