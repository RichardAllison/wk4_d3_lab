  require( 'sinatra' )
  require( 'sinatra/contrib/all' )
  require( 'pry-byebug' )
  require_relative('models/pizza.rb')


  get('/pizzas') do
    @pizzas = Pizza.all()

    erb( :index)
  end

  get('/pizzas/new') do
    erb ( :new)
  end


  get('/pizzas/:id') do
    id = params['id']
    @pizza = Pizza.find(id)
    erb( :show)
  end

  post('/pizzas') do
    @pizza = Pizza.new(params)
    @pizza.save()
    erb( :create)
  end
