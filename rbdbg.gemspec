# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'rbdbg'

Gem::Specification.new do |s|
	s.name 									= 'rbdbg'
	s.version 							= RbDbg::VERSION
	s.homepage 							= "http://www.hammackj.com/"
	s.summary 							= "RbDbg"
	s.description 					= "rbdbg is a debugger for Windows, Linux and OSX. Currently Under heavy development."
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['rbdbg.gemspec']
	s.default_executable 		= 'rbdbg'
	s.executables 					= ['rbdbg']
	s.require_paths 				= ["lib"]
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.add_dependency('choice', '>= 0.1.4')
	
end
