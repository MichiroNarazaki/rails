class ApplicationController < ActionController::Base
	# def hello
	# 	render html:"¡hola,mundo"
	# end
	def goodbye
		render html:"good bye!君の運命の人は僕じゃない〜!"
	end
end

