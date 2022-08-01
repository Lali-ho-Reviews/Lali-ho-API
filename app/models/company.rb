class Company < ApplicationRecord
    include PgSearch::Model
    has_many :reviews , dependent: :destroy
    has_many :company_categories
    has_many :categories, through: :company_categories

    
    pg_search_scope :search_by_name,
                    against: :name,
                    using: {
                    tsearch: { dictionary: "english", any_word: true },
                    }
end
