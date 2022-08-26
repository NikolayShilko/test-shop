require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	
	erb :about
end

get '/visit' do
	erb :visit
end
 
 post '/visit' do

 @username=params[:username]
 @phone=params[:phone]
 @datetime=params[:datetime]
 @barber=params[:barber]
 #if @username==""        #Вариант номер один
 #	@error="Введите имя!"
 #	return erb:visit
 #end
 hh={:username=>"Введите имя",:phone=>"Введите телефон",:datetime=>"Введите дату"}  # Вариант номер два
 hh.each  do |key, value|
 if params[key]==""
 	@error=hh[key]
 	return erb :visit
 end
end


 	erb "ОК  данные получены #{@username};#{@phone};#{@datetime};Мастер#{@barber}"
 end