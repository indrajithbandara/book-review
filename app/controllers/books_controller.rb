class BooksController < ApplicationController
	
	before_action :find_book, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]


	def index
		if params[:category].blank?
			# show all books get the latest
			# published to show first
			@books = Book.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@books = Book.where(:category_id => @category_id).order("created_at DESC")
		end	
	end

	def create
		@book = current_user.books.build(book_params)
		@book.category_id = params[:category_id]
		if @book.save
			flash[:success] = "#{@book.title} was successfully saved !"
			redirect_to root_path
		else
			flash.now[:danger] = @book.errors.full_messages.to_sentence
			render 'new'
		end	
	end

	def destroy
		@book.destroy
		flash[:danger] = "#{@book.title} was successfully deleted !"
		redirect_to root_path
	end

	def edit
		@categories = Category.all.map { |c| [c.name, c.id] }
	end

	def show
	end

	def new 
		# associate user_id with a new book
		# a user has_many :books
		# a book belongs_to :user
		@book = current_user.books.build
		@categories = Category.all.map { |c| [c.name, c.id] }
	end

	def update
		@book.category_id = params[:category_id]
		if @book.update(book_params)
			flash[:success] = "#{@book.title} was successfully updated !"
			redirect_to root_path
		else
			flash.now[:danger] = @book.errors.full_messages.to_sentence
			render 'edit'
		end		
	end

	private

	def book_params
		params.require(:book).permit(:title, :description, :author, :category_id)
	end


	def find_book
		@book = Book.find(params[:id])
	end

end
