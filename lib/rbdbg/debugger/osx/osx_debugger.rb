
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
					bit = is_proc_64_bit?
					
					if !bit
						puts "Process is 32 bit, Which is not support yet."
						exit
					end
					
					exit
					
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
										
					tmp = mib.get_array_of_long(0, SysCtl::CTL_MAXNAME)				
					tmp[miblen.get_long(0)] = @pid
					
					mib.write_array_of_long(tmp)
					
					mlen = miblen.get_long(0) + 1
										
					res = SysCtl.sysctl(mib, mlen, cpu_type, len, nil, 0)
					
					if res == -1
						puts "Error #{cpu_type.get_long(0)}"
					end
					
					cpu = cpu_type.get_int(0)

					printf "0x%x\n", cpu				
					printf "0x%x\n", Machine::CPU_TYPE_I386
					printf "0x%x\n", Machine::CPU_TYPE_X86_64
										
					case cpu
						when Machine::CPU_TYPE_I386
							puts "32"
							return false
						when Machine::CPU_TYPE_X86_64
							puts "64"
							return true
						else
							return false
					end
				end
			end
		end
	end
end