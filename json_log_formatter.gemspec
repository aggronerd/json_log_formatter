Gem::Specification.new do |s|
  s.name        = 'json_log_formatter'
  s.version     = '0.0.1'
  s.date        = '2016-08-10'
  s.summary     = 'Json log formatter for Rails'
  s.authors     = ['Gregory Doran']
  s.email       = 'greg@gregorydoran.co.uk'
  s.files       = ['lib/formatter.rb']
  s.add_dependency 'activesupport', '~> 4.2'
  s.add_development_dependency 'rspec'
end