require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @book = books(:one)
    user = users(:one)
    @token = authenticated_header(user)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should get search" do
    get books_url(q: 'five'), as: :json  
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, headers: @token, params: { description: @book.description, price: @book.price, title: @book.title }, as: :json
    end

    assert_response 201
  end

  test "should show book" do
    get book_url(@book), headers: @token, as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), headers: @token, params: { description: @book.description, price: @book.price, title: @book.title }, as: :json
    assert_response 200
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book), headers: @token, as: :json
    end

    assert_response 200
  end
end
