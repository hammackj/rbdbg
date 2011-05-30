
module RbDbg
	module Debugger
		#
		#
		class Base

			#
			#
			def initialize (pid=0)
				@pid = pid.to_i
			end
		
			def attach
			end
		
			def detach
			end
			
			def load
			end
			
			
		
		
		end
	end
end