require 'rubygems'
require 'sinatra'
require 'sqlite3'
#require 'sinatra/reloader'
def get_db
 	return SQLite3::Database.new 'barbershop.db'
 end
configure do
	db=get_db
	db.execute 'CREATE TABLE IF NOT EXISTS "Users"

	("username"	TEXT,

	"phone"	TEXT,
	"datestamp"	TEXT,
	"barber"	TEXT,
	"color"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
)'
	

	end

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
 @datestamp=params[:datetime]
 @barber=params[:barber]
 @color=params[:color]
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
db=get_db
db.execute 'insert into Users(username,phone,datestamp,barber,color ) 
                                                                          
values ( ?,?,?,?,?)',[@username,@phone,@datestamp,@barber,@color]        #запись данных в базу данных


 	erb "ОК  данные получены #{@username};#{@phone};#{@datetime};Мастер#{@barber};цвет#{@color}"
 end
 
