require_relative './../src/parking_space'
require_relative './../src/dispatcher'
class CreateParkingSpace
	def initialize
		@latest_parking_lot = []
		@current_parking_lot = nil
		@rule = nil
	end

	def create input
		unless input == ""
			sliced_input = input.split(/\s/)
		    command = sliced_input[0]
		    if  command == 'create_parking_lot'
		      no_of_slots = sliced_input[1]
		      @latest_parking_lot.push(ParkingSpace.new(no_of_slots))
		  	elsif command == "dispatch_rule"
		  		@rule = sliced_input[1]
		    else
		      @current_parking_lot = Dispatcher.new(@latest_parking_lot, @rule).dispatch
		      @current_parking_lot.send(command, *([sliced_input[1], sliced_input[2]].compact))
		    end
		end
	end
end