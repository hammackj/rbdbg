module RbDbg
	module Debugger
		module OSX
		end
	end
end


require 'rbdbg/debugger/osx/mach'
require 'rbdbg/debugger/osx/ptrace'
require 'rbdbg/debugger/osx/threadstate64'
require 'rbdbg/debugger/osx/proc'
require 'rbdbg/debugger/osx/externproc'
require 'rbdbg/debugger/osx/sysctl'
require 'rbdbg/debugger/osx/machine'

require 'rbdbg/debugger/osx/osx_debugger'