require "rails_helper"

RSpec.describe UserBook, type: :model do
  it "connects users and books in both directions" do
    oliver = User.create!(username: "Oliver")
    alex = User.create!(username: "Alex")
    hunger_games = Book.create!(title: "The Hunger Games")
    catching_fire = Book.create!(title: "Catching Fire")

    UserBook.create!(user: oliver, book: hunger_games)
    UserBook.create!(user: oliver, book: catching_fire)
    UserBook.create!(user: alex, book: hunger_games)

    expect(oliver.books).to contain_exactly(hunger_games, catching_fire)
    expect(hunger_games.users).to contain_exactly(oliver, alex)
  end

  it "requires a user and a book" do
    expect(UserBook.new).not_to be_valid
  end

  it "removes assignments when a book is deleted" do
    user = User.create!(username: "Oliver")
    book = Book.create!(title: "The Hunger Games")
    UserBook.create!(user: user, book: book)

    expect { book.destroy! }.to change(UserBook, :count).by(-1)
    expect(User.exists?(user.id)).to eq(true)
  end
end
