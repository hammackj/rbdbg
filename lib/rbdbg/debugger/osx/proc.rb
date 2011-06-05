module RbDbg
	module Debugger
		module OSX
			module Proc
				extend FFI::Library
				ffi_lib FFI::Library::LIBC
												
				#attach_function :proc_find, [:int], :pointer
				#attach_function :proc_is64bit, [:pointer], :int
			end
		end
	end
end