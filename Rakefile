$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "rbdbg"
 
task :build do
  system "gem build rbdbg.gemspec"
end
 
task :release => :build do
  system "gem push rbdbg-#{RbDbg::VERSION}.gem"
end

task :clean do
	system "rm *.gem"
end