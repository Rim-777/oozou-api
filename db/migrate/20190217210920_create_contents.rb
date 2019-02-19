class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :author_id, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.datetime :published_at, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.string :status, index: true, default: 'draft', null: false
      t.timestamps
    end
  end
end
