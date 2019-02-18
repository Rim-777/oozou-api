class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :author_id, index: true, foreign_key: true
      t.string :title
      t.datetime :published_date
      t.text :summary
      t.text :content
      t.string :status, index: true, default: 'draft'
      t.timestamps
    end
  end
end
