class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company
  validates_presence_of :text
end
