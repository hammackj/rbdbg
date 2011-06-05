# module RbDbg
# 	module Debugger
# 		module OSX
# 			module Proc
# 				
# 				  class Vmspace < FFI::Struct
# 				    layout(
# 				           :dummy, :int32,
# 				           :dummy2, caddr_t,
# 				           :dummy3, [int32_t, 5],
# 				           :dummy4, [caddr_t, 3]
# 				    )
# 				  end
# 				  class ExternProcPUnPSt1 < FFI::Struct
# 				    layout(
# 				           :__p_forw, :pointer,
# 				           :__p_back, :pointer
# 				    )
# 				  end
# 
# 				   class ExternProcPUn < FFI::Union
# 				     layout(
# 				            :__p_starttime, Timeval,
# 				            :p_st1, ExternProcPUnPSt1
# 				     )
# 				   end
# 
# 				   class ExternProc < FFI::Struct
# 				     layout(
# 										:u, ExternProcPUn,
# 				            :p_vmspace, :pointer,
# 				            :p_sigacts, :pointer,
# 				            :p_flag, :int,
# 				            :p_stat, :char,
# 				            :p_pid, pid_t,
# 				            :p_oppid, pid_t,
# 				            :p_dupfd, :int,
# 				            :user_stack, caddr_t,
# 				            :exit_thread, :pointer,
# 				            :p_debugger, :int,
# 				            :sigwait, :int,
# 				            :p_estcpu, u_int,
# 				            :p_cpticks, :int,
# 				            :p_pctcpu, fixpt_t,
# 				            :p_wchan, :pointer,
# 				            :p_wmesg, :pointer,
# 				            :p_swtime, u_int,
# 				            :p_slptime, u_int,
# 				            :p_realtimer, Itimerval,
# 				            :p_rtime, Timeval,
# 				            :p_uticks, u_quad_t,
# 				            :p_sticks, u_quad_t,
# 				            :p_iticks, u_quad_t,
# 				            :p_traceflag, :int,
# 				            :p_tracep, :pointer,
# 				            :p_siglist, :int,
# 				            :p_textvp, :pointer,
# 				            :p_holdcnt, :int,
# 				            :p_sigmask, sigset_t,
# 				            :p_sigignore, sigset_t,
# 				            :p_sigcatch, sigset_t,
# 				            :p_priority, u_char,
# 				            :p_usrpri, u_char,
# 				            :p_nice, :char,
# 				            :p_comm, a(MAXCOMLEN+1).char,
# 				            :p_pgrp, :pointer,
# 				            :p_addr, :pointer,
# 				            :p_xstat, u_short,
# 				            :p_acflag, u_short,
# 				            :p_ru, :pointer,
# 				            :p_un, ExternProcPUn
# 				     )
# 				     def p_wmesg=(str)
# 				       @p_wmesg = FFI::MemoryPointer.from_string(str)
# 				       self[:p_wmesg] = @p_wmesg
# 				     end
# 				     def p_wmesg
# 				       @p_wmesg.get_string(0)
# 				     end
# 				 
# 				   end
# 			end
# 		end
# 	end
# end
