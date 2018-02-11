class Book < ApplicationRecord

	LETTERS_AND_NUMBER = /\A[a-zA-Z0-9]+\z/
	ONLY_LETTERS = /\A[a-zA-Z]+\z/

	validates :title, presence: true, format: { with: LETTERS_AND_NUMBER,
    message: "only allows letters and numbers" }, length: { minimum: 2, maximum:255},
    uniqueness: true, on: :create, uniqueness: true, on: :update 
	
	validates :description, presence: true, length: { minimum: 2, maximum:65535 }
	
	validates :author, presence: true, format: { with: ONLY_LETTERS,
    message: "only allows letters" }, length: { minimum: 3, maximum:255 }

  # SEO Friendly url from the id to the title 
  def to_param  # overridden https://apidock.com/rails/ActiveRecord/Base/to_param
    title
  end  

end
