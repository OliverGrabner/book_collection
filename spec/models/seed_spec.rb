require "rails_helper"

RSpec.describe "Seed data" do
  it "loads books into the test database" do
    Rails.application.load_seed

    expect(Rails.env).to eq("test")
    expect(Book.exists?(title: "The Hunger Games")).to eq(true)
    expect(Book.exists?(title: "Grokking the Coding Interview")).to eq(true)
  end
end
