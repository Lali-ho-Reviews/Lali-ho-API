class CreateCompanyCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :company_categories do |t|
      t.references :company, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
