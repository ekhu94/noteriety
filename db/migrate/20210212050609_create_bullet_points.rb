class CreateBulletPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :bullet_points do |t|
      t.string :keywords
      t.belongs_to :note, null: false, foreign_key: true
      t.timestamps
    end
  end
end
