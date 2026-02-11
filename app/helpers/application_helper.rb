module ApplicationHelper
	def flash_class(type)
		case type.to_s
		when "notice"
			"border-emerald-200 bg-emerald-50 text-emerald-900"
		when "alert"
			"border-rose-200 bg-rose-50 text-rose-900"
		else
			"border-slate-200 bg-slate-50 text-slate-900"
		end
	end
end
