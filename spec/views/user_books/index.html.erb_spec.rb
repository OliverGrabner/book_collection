require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    assign(:user_books, [
      UserBook.create!(
        user: User.create!(username: "Oliver"),
        book: Book.create!(title: "The Hunger Games")
      ),
      UserBook.create!(
        user: User.create!(username: "Oliver"),
        book: Book.create!(title: "The Hunger Games")
      )
    ])
  end

  it "renders a list of user_books" do
    render
    cell_selector = 'td'
    assert_select cell_selector, text: /Oliver/, count: 2
    assert_select cell_selector, text: /The Hunger Games/, count: 2
  end
end

