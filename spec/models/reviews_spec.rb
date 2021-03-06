require 'spec_helper'

describe Review do
  let(:review) { FactoryGirl.build(:review) }
  let(:movie) { FactoryGirl.build(:movie) }

  it "is valid" do
    expect(review).to be_valid
  end

  it "is invalid without a body" do
    review.body = nil
    expect(review).to_not be_valid
  end

  it "is invalid without a movie" do
    review.movie = nil
    expect(review).to_not be_valid
  end

  it { should belong_to(:movie) }
end
