module ApplicationHelper

	def time_string(time)
		time = time.in_time_zone("Berlin")
		@day = time.day < 10 ? "0#{time.day}" : time.day
		@month = time.month < 10 ? "0#{time.month}" : time.month
		"#{@day}.#{@month}.#{time.year} um #{time.hour}:#{time.min} Uhr"
	end
	
end
