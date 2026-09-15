require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    expect(Book.new(title: "Design Patterns")).to be_valid
  end

  it "does not save a book with a blank title" do
    book = Book.new(title: "")

    expect(book.save).to eq(false)
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "saves the author" do
    book = Book.create!(title: "The Hunger Games", author: "Suzanne Collins")
    expect(book.reload.author).to eq("Suzanne Collins")
  end

  it "saves the price" do
    book = Book.create!(title: "The Hunger Games", price: 12.99)
    expect(book.reload.price).to eq(12.99)
  end

  it "saves the published date" do
    book = Book.create!(title: "The Hunger Games", published_date: Date.new(2008, 9, 14))
    expect(book.reload.published_date).to eq(Date.new(2008, 9, 14))
  end

  it "persists the title it was created with" do
    book = Book.create!(title: "The Pragmatic Programmer")
    expect(book.reload.title).to eq("The Pragmatic Programmer")
  end
end
