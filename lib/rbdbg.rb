module RbDbg
	APP_NAME = "rbdbg"
	VERSION = "0.0.1"
end

require 'optparse'
require 'ffi'

require 'rbdbg/debugger/base'
require 'rbdbg/debugger/osx'