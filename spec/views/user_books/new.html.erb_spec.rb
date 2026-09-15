require 'rails_helper'

RSpec.describe "user_books/new", type: :view do
  before(:each) do
    assign(:user_book, UserBook.new(
      user: User.create!(username: "Oliver"),
      book: Book.create!(title: "The Hunger Games")
    ))
  end

  it "renders new user_book form" do
    render

    assert_select "form[action=?][method=?]", user_books_path, "post" do

      assert_select "select[name=?]", "user_book[user_id]"

      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end

