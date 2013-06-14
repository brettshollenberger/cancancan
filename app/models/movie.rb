class Movie < ActiveRecord::Base
  attr_accessible :description, :title, :reviews_attributes

  validates :description, :title, {
    presence: true
  }

  has_many :reviews, {
    dependent: :destroy,
    inverse_of: :movie
  }

  accepts_nested_attributes_for :reviews, {
    reject_if: lambda { |a| a[:content].blank? },
    allow_destroy: true
  }

end
