module RbDbg
	module Debugger
		module OSX
			module SysCtl
				extend FFI::Library
				ffi_lib FFI::Library::LIBC
				
				CTL_MAXNAME	= 12
				
				typedef :long, :cpu_type_t
							
				attach_function :sysctlnametomib, [:pointer, :pointer, :pointer], :int
				attach_function :sysctl, [:pointer, :u_int, :pointer, :pointer, :pointer, :int], :int
			end
		end
	end
end
