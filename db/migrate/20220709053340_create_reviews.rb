class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :text
      t.integer :rating
      t.string :author

      t.timestamps
    end
  end
end
