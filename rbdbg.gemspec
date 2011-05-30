# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'rbdbg'

Gem::Specification.new do |s|
	s.name 									= RbDbg::APP_NAME
	s.version 							= RbDbg::VERSION
	s.homepage 							= "http://www.hammackj.com/projects/rbdbg"
	s.summary 							= "RbDbg"
	s.description 					= "#{RbDbg::APP_NAME} is a console debugger for Windows/OSX/Linux, primarily designed for automation."
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ["#{RbDbg::APP_NAME}.gemspec"]
	s.executables 					= ["#{RbDbg::APP_NAME}"]
	s.require_paths 				= ["lib"]
	
	s.required_rubygems_version = ">= 1.3.6"
	s.rubyforge_project         = "rbdbg"
	
	s.add_development_dependency "rspec"
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.add_dependency('ffi', '>= 1.0.9')
end
