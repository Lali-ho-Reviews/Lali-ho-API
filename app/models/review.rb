class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company
  validates_presence_of :text, :rating
  

  def transform_review
    if self.user
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

  def company_name
    self.company.name
  end

  def self.find_by_user(username)
    user = User.find_by(username: username)
    return self.where(user: user)
  end
end
