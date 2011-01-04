# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'rbdbg'

Gem::Specification.new do |s|
	s.name 									= 'rbdbg'
	s.version 							= RbDbg::VERSION
	s.homepage 							= "http://www.hammackj.com/"
	s.summary 							= "RbDbg"
	s.description 					= "rbdbg is a console debugger for Windows, primarily designed for automation."
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['rbdbg.gemspec']
	s.default_executable 		= 'rbdbg'
	s.executables 					= ['rbdbg']
	s.require_paths 				= ["lib"]
	
	s.required_rubygems_version = ">= 1.3.6"
	s.rubyforge_project         = "rbdbg"
	
	s.add_development_dependency "rspec"
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.add_dependency('choice', '>= 0.1.4')
	
end
