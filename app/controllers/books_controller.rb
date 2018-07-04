class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = if params[:term]
    Book.where('name LIKE ?', "%#{params[:term]}%")
  else
    @books=Book.all
  end
  	
  	
  end
   def show
    @books = Book.find(params[:id])
  end
  def new
  	@book=Book.new
  end

  def edit
  @books = Book.find(params[:id])
end
  

  def create
  	@books = Book.new(books_params)
    
 
  if @books.save
    Bookmailer.email(current_user).deliver_now

  redirect_to @books
else
	render 'new'
end
  	
  end

  def update
  @books = Book.find(params[:id])
 
  if @books.update(books_params)
    redirect_to @books
  else
    render 'edit'
  end
end

def destroy
  @books = Book.find(params[:id])
  @books.destroy
 
  redirect_to books_path
end

  private
  def books_params 

    params.require(:book).permit!
  end
end
