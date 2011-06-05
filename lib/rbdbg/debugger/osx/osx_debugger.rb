
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
					is_proc_64_bit?
					
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
					
					puts "thread_state => \n#{thread_state.inspect}"					
				end
				
				def is_proc_64_bit?
					tmp = Array.new(SysCtl::CTL_MAXNAME, 0)
					mib = FFI::MemoryPointer.new(:long, SysCtl::CTL_MAXNAME)
					mib.write_array_of_long(tmp)
										
					miblen = FFI::MemoryPointer.new(:long, 1).write_long SysCtl::CTL_MAXNAME
					#miblen = SysCtl::CTL_MAXNAME
					cpu_type = FFI::MemoryPointer.new(:long, 1).write_long 0
					len = FFI::MemoryPointer.new(:long, 1).write_long cpu_type.size
					
					if SysCtl.sysctlnametomib("sysctl.proc_cputype", mib, miblen) != 0
						return nil
					end
					
					puts "miblen -> #{miblen.get_int(0)}"
					
					tmp = mib.get_array_of_long(0, SysCtl::CTL_MAXNAME)				
					tmp[miblen.get_long(0)] = @pid
					
					puts "tmp => #{tmp}"
					
					mib.write_array_of_long(tmp)
					
					puts "--\n#{mib.inspect}\n#{miblen + 1}\n#{cpu_type}\nlen => #{len.read_long}\n"
					
					res = SysCtl.sysctl(mib, miblen.get_long(0), cpu_type, len, nil, 0)
					
					if res == -1
						puts "Error #{cpu_type.get_long(0)}"
					end
					
					puts "#{cpu_type.get_long(0)}"
					
					case cpu_type.get_long(0)
						when Machine::CPU_TYPE_X86_64
							puts "64 bit" 
						when Machine::CPU_TYPE_X86
							puts "32 bit"
					end
					
					exit
				end
			end
		end
	end
end