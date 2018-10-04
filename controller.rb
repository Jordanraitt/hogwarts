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
post '/hogwarts_students' do
  @students = Student.new(params)
  @students.save()
  erb(:create)
end

post '/hogwarts_students/:id/delete' do
  id = params[:id].to_i()
  @students = Student.find(id)
  @students.delete
  erb(:delete)
end

get '/hogwarts_students/:id/edit' do
  id = params[:id].to_i()
  @students = Student.find(id)
  erb(:edit)
end

post '/hogwarts_student/:id' do
  @students = Student.new(params)
  @students.update()
  erb(:update)
end



#
