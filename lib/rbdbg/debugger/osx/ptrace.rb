module RbDbg
	module Debugger
		module OSX
			module Ptrace
				extend FFI::Library
				ffi_lib FFI::Library::LIBC
				
				attach_function :ptrace, [:int, :pid_t, :ulong, :int], :int
			end
		end
	end
end