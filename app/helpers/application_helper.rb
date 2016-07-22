module ApplicationHelper

	def time_string(time)
		time = time.in_time_zone("Berlin")
		day = time.day < 10 ? "0#{time.day}" : time.day
		month = time.month < 10 ? "0#{time.month}" : time.month
		min = time.min < 10 ? "0#{time.min}" : time.min
		"#{day}.#{month}.#{time.year} um #{time.hour}:#{min} Uhr"
	end

	def signature_string(author, created_at, updated_at)
		created = "Verfasst von #{author} am #{time_string(created_at)}. "
		updated = created_at.to_s != updated_at.to_s ? "Zuletzt bearbeitet am #{time_string(updated_at)}." : ""
		created + updated
	end
	
end
