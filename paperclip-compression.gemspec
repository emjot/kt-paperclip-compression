# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'kt-paperclip-compression'
  s.version     = '2.0.0'
  s.summary     = 'Image compression for Paperclip'
  s.description = 'JPEG and PNG compression for Paperclip gem'
  s.author      = 'İ. Emre Kutlu, Adam Anderson'
  s.email       = 'emrekutlu@gmail.com, adam@makeascene.com, herold@emjot.de'
  s.files       = Dir['lib/**/*.rb'] + Dir['bin/**/*']
  s.bindir      = 'bin'
  s.homepage    = 'https://github.com/emjot/kt-paperclip-compression'
  s.license     = 'MIT'

  s.require_paths = ['lib']

  s.required_ruby_version = '>= 3.2.0'

  s.add_dependency 'kt-paperclip', '>= 6.4.1'
  s.add_dependency 'os', '~> 1.0', '>= 1.0.0'
end
