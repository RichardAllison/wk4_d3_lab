require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

# Index
get('/pizzas') do
  @pizzas = Pizza.all()
  erb(:index)
end

# New
get('/pizzas/new') do
  erb(:new)
end

# Show
get('/pizzas/:id') do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb(:show)
end

# Create
post('/pizzas') do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

# Delete
post('/pizzas/:id/delete') do
  id = params['id']
  @pizza = Pizza.find(id)
  @pizza.delete
  erb( :destroy)
end

# Edit
get('/pizzas/:id/edit') do
id = params['id']
@pizza = Pizza.find(id)
erb( :edit)
end

# Update
post('/pizzas/:id') do
@pizza = Pizza.new(params)
@pizza.update()
erb( :update)
end

# update preselect: "selected" - inserting a string into the html, which is a boolean attribute - either there or not, takes no value.
# value = "Calzone" <%= "selected" if @pizza.topping == "Calzone" %> for each option in edit
