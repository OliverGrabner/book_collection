require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    expect(Book.new(title: "Design Patterns")).to be_valid
  end

  it "persists the title it was created with" do
    book = Book.create!(title: "The Pragmatic Programmer")
    expect(book.reload.title).to eq("The Pragmatic Programmer")
  end
end
