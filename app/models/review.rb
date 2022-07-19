class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company
  validates_presence_of :text

  def transform_review
    return {
      id: self.id,
      text: self.text,
      rating: self.rating,
      author: self.author,
      username: self.user.username
    }
  end
end
