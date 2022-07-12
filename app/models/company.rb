class Company < ApplicationRecord
    has_many :reviews , dependent: :destroy
end
