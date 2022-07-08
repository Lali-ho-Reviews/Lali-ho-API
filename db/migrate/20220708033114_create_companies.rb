class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :slogan
      t.integer :rank
      t.string :ff_id
      t.integer :members
      t.string :server

      t.timestamps
    end
  end
end
