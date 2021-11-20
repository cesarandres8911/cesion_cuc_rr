class BooksController < ApplicationController
  def index
    books = Book.all
    render json: { books: books }, status: 200
  end

  def create
    book =  Book.new(book_params)

    if book.save
      render json: { book: book}, status: 200
    else
      render json: { errors: book.errors.messages }, status: 406
    end
  end

  def show
    book = Book.find(params[:id])
    render json: { book: book}, status: 200
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      render json: { book: book}, status: 201
    else
      render json: { errors: book.errors.messages }, status: 406
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :content, :author_id)
  end
end
