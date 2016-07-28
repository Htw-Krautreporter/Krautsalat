module RightsHelper

	def get_role_name(right_level)
		if (right_level == 0)
			"Leser"
		elsif (right_level == 1)
			"Autor"
		elsif (right_level == 2)
			"Admin"
		else
			"Keine gültige Rolle"
		end

	end

end
