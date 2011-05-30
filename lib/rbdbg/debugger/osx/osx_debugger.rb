
module RbDbg
	module Debugger
		module OSX
			class OSXDebugger < Base	
				def attach
					
					addr = 0
					data = 0
					result = Ptrace.ptrace(Ptrace::PT_ATTACH, @pid, addr, data)
					
					puts "result => #{result.inspect}"
					puts "data => #{data.inspect}"
					
					Ptrace.ptrace(Ptrace::PT_DETACH, @pid, 0, 0)
					
				end
			
				def print_registers
					target ||= Mach.mach_task_self
					port = FFI::MemoryPointer.new :uint, 1
					result = Mach.task_for_pid(target, @pid, port)
										
					threads = FFI::MemoryPointer.new :pointer, 1
					count = FFI::MemoryPointer.new :int, 1
					
					Mach.task_threads(port.read_uint, threads, count)
					
					
					puts "threads = #{threads.inspect}\ncount = #{count.inspect}\ncount = #{count.read_uint}"
					
					puts "threads = #{threads.read_pointer.read_array_of_uint(count.read_uint)}"
					
					thread = threads.read_pointer.read_array_of_uint(count.read_uint).first
					thread_flavor = 4
					state = FFI::MemoryPointer.new Mach::ThreadState64.new 
					count = FFI::MemoryPointer.new(:int, 1).write_uint 42
					
					r = Mach.thread_get_state(thread, thread_flavor, state, count)
					
					thread_state = Mach::ThreadState64.new state
					
					puts "thread_state => #{thread_state.inspect}"					
				end
			end
		end
	end
end