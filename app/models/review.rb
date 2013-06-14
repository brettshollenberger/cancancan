class Review < ActiveRecord::Base
  attr_accessible :body, :movie_id

  validates :body, :movie, {
    presence: true
  }

  validates :movie_id, {
    numericality: true
  }

  belongs_to :movie, {
    inverse_of: :reviews
  }
end
