class Company < ApplicationRecord
    include PgSearch::Model
    has_many :reviews , dependent: :destroy
    has_many :company_categories
    has_many :categories, through: :company_categories
    validates_presence_of :name, :ff_id, :server

    # I love pg_search <3
    pg_search_scope :search_by_name,
                    against: :name,
                    using: {
                    tsearch: { dictionary: "english", any_word: true },
                    }
end
