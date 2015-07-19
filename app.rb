class BooksApp < Sinatra::Base

# root route
get "/" do
  redirect('/books')
end

# about page
get "/about" do
  erb :about
end

# index
get '/books' do
  @books = Book.all
  erb(:"books/index")
end

# new
get '/books/new' do
  @book = Book.new
  erb(:"books/new")
end

# create
post '/books' do
  @book = Book.new(params[:book])
  if @book.save
    redirect("/books/#{@book.id}")
  else
    erb(:"books/new")
  end
end

# show      
get '/books/:id' do
  @book = Book.find(params[:id])
  erb(:"books/show")
end

# edit
get '/books/:id/edit' do
  @book = Book.find(params[:id])
  erb(:"books/edit")
end

# update
put '/books/:id' do
  @book = Book.find(params[:id]) 
  if @book.update_attributes(params[:book])
    redirect ("/books")
  else
    erb(:"books/new")
  end
end

# destroy
delete '/books/:id' do
  @book = Book.find(params[:id])
  if @book.destroy
    redirect('/books')
  else
    redirect("/books/#{@book.id}")
  end
end  
end

      




