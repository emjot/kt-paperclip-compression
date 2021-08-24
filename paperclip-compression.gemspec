# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'kt-paperclip-compression'
  s.version     = '1.2.1'
  s.summary     = 'Image compression for Paperclip'
  s.description = 'JPEG and PNG compression for Paperclip gem'
  s.author      = 'İ. Emre Kutlu, Adam Anderson'
  s.email       = 'emrekutlu@gmail.com, adam@makeascene.com'
  s.files       = Dir['lib/**/*.rb'] + Dir['bin/**/*']
  s.bindir      = 'bin'
  s.homepage    = 'http://github.com/adamtao/kt-paperclip-compression'
  s.license     = 'MIT'

  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_runtime_dependency 'kt-paperclip', "~> 6.4", ">= 6.4.1"
  s.add_runtime_dependency 'os', '~> 1.0', '>= 1.0.0'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  s.add_development_dependency 'rspec', '3.7.0'
  s.add_development_dependency 'guard-rspec', '4.7.3'
end
