class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company
  validates_presence_of :text

  def transform_review
    if self.user.username
      return {
        id: self.id,
        text: self.text,
        rating: self.rating,
        username: self.user.username
      }
    else
      return {
        id: self.id,
        text: self.text,
        rating: self.rating,
        author: self.author
      }
    end
  end
end
