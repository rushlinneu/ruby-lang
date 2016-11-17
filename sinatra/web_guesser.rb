require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
@@times = 5

get '/' do

	# throw params.inspect
	if params['guess'] != nil
		guess = params['guess'].to_i
		if guess == SECRET_NUMBER
			msg = "Got it!"
			SECRET_NUMBER = rand(100)
			@@times = 5
		elsif guess > SECRET_NUMBER
			msg = "Too high!"
		else
			msg = "Too low!";
		end

		if @@times == 0
			msg += "You lost and a new number has been generated"
			SECRET_NUMBER = rand(100)
			@@times = 5
		else
			@@times -= 1
			msg += "you have #{@@times} time left"
		end
	end
	
	erb :index, locals: {number: SECRET_NUMBER, msg: msg}
end