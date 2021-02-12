class CreateSummaries < ActiveRecord::Migration[6.1]
  def change
    create_table :summaries do |t|
      t.text :content
      t.belongs_to :note, null: false, foreign_key: true
      t.timestamps
    end
  end
end
