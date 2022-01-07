class BooksController < ApplicationController
  before_action :authorize_request, except: :index
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = params[:q].present? ? Book.where("title LIKE ?", "%" + params[:q] + "%") : Book.all  
    render json: @books
  end

  # GET /books/1
  def show
    render json: {book: @book, cover_image: cover_image_url(@book)}
  end

  # POST /books
  def create
    @book = @current_user.books.new(book_params)

    if @book.save
      render json: {book: @book, cover_image: cover_image_url(@book)}, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    if @book.destroy
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = @current_user.books.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Book not found' }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.permit(:title, :cover_image, :description, :price, :publish)
    end

    def cover_image_url(book)
    book.cover_image.attached? ? url_for(book.cover_image) : 'No image attached'
  end
end
