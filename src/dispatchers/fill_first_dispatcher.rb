require 'byebug'
class FillFirstDispatcher
	def initialize parking_lots
		@parking_lots = parking_lots
	end
	def find_parking_lot
		current_parking_lot = @parking_lots.select { |lot| (lot.slots.count - lot.status.count) > 0 }
		current_parking_lot
	end
end