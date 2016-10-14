require_relative 'config/environment'

class App < Sinatra::Base

	get "/reversename/:name" do 
		reversed_name = params[:name].reverse
		"#{reversed_name}"
	end

	get "/square/:number" do
		square = (params[:number].to_i)*(params[:number].to_i)
		"#{square}"
	end

	get '/say/:number/:phrase' do
		phrase = params[:phrase]
		number = params[:number].to_i
		sentence = []
		number.times do sentence << phrase end
		sentence.join("\n")
	end

	get '/say/:word1/:word2/:word3/:word4/:word5' do
		word1 = params[:word1]
		word2 = params[:word2]
		word3 = params[:word3]
		word4 = params[:word4]
		word5 = params[:word5]		
		"#{word1} #{word2} #{word3} #{word4} #{word5}."
	end

	get '/:operation/:number1/:number2' do
		operation = params[:operation]
		@numbers = [params[:number1].to_f, params[:number2].to_f]

		case operation

		when "add"
			"#{@numbers.inject(:+).round}"
		when "subtract"
			"#{@numbers.inject(:-).round}"
		when "multiply"
			"#{@numbers.inject(:*).round}"
		when "divide"
			"#{@numbers.inject(:/)}"
		end
	end

end