module ApplicationHelper
  
	def full_title(page_title)
		base_title = "Facebook"
		if page_title.empty? || page_title == "Sign up" || page_title == "Sign in"
			base_title
		else
			page_title
		end
	end
end
