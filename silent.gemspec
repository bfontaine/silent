require './lib/silent'

Gem::Specification.new do |s|
    s.name          = 'silent'
    s.version       = '0.1.0'
    s.date          = Time.now

    s.summary       = 'Silently execute a piece of code'
    s.description   = <<EOD
Temporary disable stdout/stderr while you execute a piece of code
EOD
    s.license       = 'MIT'

    s.author        = 'Baptiste Fontaine'
    s.email         = 'batifon@yahoo.fr'
    s.homepage      = 'https://github.com/bfontaine/silent'

    s.files         = Dir['lib/**/*.rb']
    s.test_files    = Dir['tests/**/*.rb']
    s.require_path  = 'lib'

    s.add_development_dependency 'simplecov'
    s.add_development_dependency 'rake'
    s.add_development_dependency 'test-unit'
    s.add_development_dependency 'coveralls'
end
