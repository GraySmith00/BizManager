class CreateRevenues < ActiveRecord::Migration[5.0]
  def change
    create_table :revenues do |t|
      t.string :source
      t.integer :amount
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
