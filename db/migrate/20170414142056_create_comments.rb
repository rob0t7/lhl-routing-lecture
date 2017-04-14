class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text   :body, null: false
      t.references :post, null: false, index: true, foreign: true

      t.timestamps
    end
  end
end
