module RbDbg
	module Debugger
		module OSX
			module Mach
				class ThreadState64 < FFI::Struct
					layout :rax, :uint64,
				         :rbx, :uint64,
				         :rcx, :uint64,
				         :rdx, :uint64,
				         :rdi, :uint64,
				         :rsi, :uint64,
				         :rbp, :uint64,
				         :rsp, :uint64,
				         :r8, :uint64,
				         :r9, :uint64,
				         :r10, :uint64,
				         :r11, :uint64,
				         :r12, :uint64,
				         :r13, :uint64,
				         :r14, :uint64,
				         :r15, :uint64,
				         :rip, :uint64,
				         :rflags, :uint64,
				         :cs, :uint64,
				         :fs, :uint64,
				         :gs, :uint64
				
					def inspect
						"RIP: 0x#{self[:rax].to_s(16).rjust(16, "0")}\n" + 
						"RBX: 0x#{self[:rbx].to_s(16).rjust(16, "0")}\n" +
						"RCX: 0x#{self[:rcx].to_s(16).rjust(16, "0")}\n" +
						"RDX: 0x#{self[:rdx].to_s(16).rjust(16, "0")}\n" +
						"RDI: 0x#{self[:rdi].to_s(16).rjust(16, "0")}\n" +
						"RSI: 0x#{self[:rsi].to_s(16).rjust(16, "0")}\n" +
						"RBP: 0x#{self[:rbp].to_s(16).rjust(16, "0")}\n" +
						"RSP: 0x#{self[:rsp].to_s(16).rjust(16, "0")}\n" +
						"R8:  0x#{self[:r8].to_s(16).rjust(16, "0")}\n" +
						"R9:  0x#{self[:r9].to_s(16).rjust(16, "0")}\n" +
						"R10: 0x#{self[:r10].to_s(16).rjust(16, "0")}\n" +
						"R11: 0x#{self[:r11].to_s(16).rjust(16, "0")}\n" +
						"R12: 0x#{self[:r12].to_s(16).rjust(16, "0")}\n" +
						"R13: 0x#{self[:r13].to_s(16).rjust(16, "0")}\n" +
						"R14: 0x#{self[:r14].to_s(16).rjust(16, "0")}\n" +
						"R15: 0x#{self[:r15].to_s(16).rjust(16, "0")}\n"
					end
				end
			end
		end
	end
end