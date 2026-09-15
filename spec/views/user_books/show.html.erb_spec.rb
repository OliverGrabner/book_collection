require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  before(:each) do
    assign(:user_book, UserBook.create!(
      user: User.create!(username: "Oliver"),
      book: Book.create!(title: "The Hunger Games")
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Oliver/)
    expect(rendered).to match(/The Hunger Games/)
  end
end

