class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def new 
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			flash[:success] = "#{@book.title} was successfully saved !"
			redirect_to root_path
		else
			flash.now[:danger] = @book.errors.full_messages.to_sentence
			render 'new'
		end	
	end

	def show
	end

	private

	def book_params
		params.require(:book).permit(:title, :description, :author)
	end

end
