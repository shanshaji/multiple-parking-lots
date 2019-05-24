require 'byebug'
class EvenlyDistributedDispatcher
	def initialize parking_lots
		@parking_lots = parking_lots
	end

	def find_parking_lot
		current_parking_lot = @parking_lots.min_by {|lot| (lot.slots.map{|slot| slot.vehicle}.compact.count.to_f / lot.slots.count.to_f )*100 }
	end
end