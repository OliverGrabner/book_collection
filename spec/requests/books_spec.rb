require "rails_helper"

RSpec.describe "Books", type: :request do
  it "creates a book and shows a success notice" do
    expect {
      post books_path, params: { book: { title: "Catching Fire" } }
    }.to change(Book, :count).by(1)

    expect(Book.order(:id).last.title).to eq("Catching Fire")
    expect(response).to redirect_to(books_path)
    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
  end

  it "creates a book with an author" do
    post books_path, params: { book: { title: "The Hunger Games", author: "Suzanne Collins" } }
    book = Book.order(:id).last
    expect(book.author).to eq("Suzanne Collins")
    get book_path(book)
    expect(response.body).to include("Suzanne Collins")
  end

  it "creates a book with a price" do
    post books_path, params: { book: { title: "The Hunger Games", price: "12.99" } }
    book = Book.order(:id).last
    expect(book.price).to eq(12.99)
    get book_path(book)
    expect(response.body).to include("12.99")
  end

  it "creates a book with a published date from dropdowns" do
    post books_path, params: { book: {
      title: "The Hunger Games",
      "published_date(1i)" => "2008",
      "published_date(2i)" => "9",
      "published_date(3i)" => "14"
    } }
    book = Book.order(:id).last
    expect(book.published_date).to eq(Date.new(2008, 9, 14))
    get new_book_path
    expect(response.body).to include('name="book[published_date(1i)]"')
    expect(response.body).to include('name="book[published_date(2i)]"')
    expect(response.body).to include('name="book[published_date(3i)]"')
  end

  it "rejects a blank title and shows an error notice" do
    expect {
      post books_path, params: { book: { title: "" } }
    }.not_to change(Book, :count)

    expect(response).to have_http_status(422)
    expect(response.request.flash[:alert]).to eq("Title is required.")
    expect(response.body).to include("Title is required.")
  end
end
