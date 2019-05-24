require_relative './../src/dispatchers/evenly_distributed_dispatcher'
require_relative './../src/dispatchers/fill_first_dispatcher'
class Dispatcher
	def initialize(parking_lots, rule)
		@parking_lots = parking_lots
		@rule = rule
	end

	def dispatch
		parking_lot = 0 
		case @rule
		when "even_distribution"
			parking_lot = EvenlyDistributedDispatcher.new(@parking_lots).find_parking_lot
		when "fill_first"
			parking_lot = FillFirstDispatcher.new(@parking_lots).find_parking_lot
		else
			raise InvalidRule
		end
		parking_lot
	end
end