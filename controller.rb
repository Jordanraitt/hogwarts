require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/hogwarts_student')
also_reload('./models/*')

#GET - INDEX ROUTE
get '/hogwarts_students' do
  @students = Student.all()
  erb(:index)
end

# NEW
get '/hogwarts_students/new' do
  erb(:new)
end

#SHOW ROUTE
get '/hogwarts_students/:id' do
  id = params[:id].to_i()
  @students = Student.find(id)
  erb(:show)
end


#CREATE
