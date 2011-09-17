lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'geoscript/version'

Gem::Specification.new do |s|
  s.name = "geoscript"
  s.version = GeoScript::VERSION
  s.platform = 'java'
  s.authors = "Craig Taverner"
  s.email = 'craig@amanzi.com'
  s.homepage = "http://github.com/craigtaverner/geoscript.rb"
  s.rubyforge_project = 'geoscript'
  s.summary = "JRuby version of GeoScript"
  s.description = <<-EOF
GeoScript is a scripting environment for GIS and spatial analysis. This project is a JRuby implementation.
EOF

  s.require_path = 'lib'
  s.files        = Dir.glob("{bin,lib,examples}/**/*").reject{|x| x=~/(tmp|target|test-data)/} + %w(README.rdoc Gemfile geoscript.gemspec)
  s.executables  = ['geoscript.rb']
  s.has_rdoc = true
  s.extra_rdoc_files = %w( README.rdoc )
  s.rdoc_options = ["--quiet", "--title", "GeoScript.rb", "--opname", "index.html", "--line-numbers", "--main", "README.rdoc", "--inline-source"]
  s.required_ruby_version = ">= 1.8.7"
#  s.add_dependency('neo4j',">= 1.0.0")
#  s.add_dependency('amanzi-sld',">= 0.0.1")
end
