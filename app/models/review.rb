class Review < ActiveRecord::Base
  attr_accessible :body, :movie_id

  validates :body, :movie, :user, {
    presence: true
  }

  validates :movie_id, {
    numericality: true
  }

  belongs_to :movie, {
    inverse_of: :reviews
  }

  belongs_to :user, {
    inverse_of: :reviews
  }
end
