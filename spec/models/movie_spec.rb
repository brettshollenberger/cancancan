require 'spec_helper'

describe Movie do
  let(:movie) { FactoryGirl.build(:movie) }

  it "is valid" do
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie.title = nil
    expect(movie).to_not be_valid
  end

  it "is invalid without a description" do
    movie.description = nil
    expect(movie).to_not be_valid
  end
end
