class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :image
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
