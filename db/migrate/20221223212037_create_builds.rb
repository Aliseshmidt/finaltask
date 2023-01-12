class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.string :name
      t.text :body
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
