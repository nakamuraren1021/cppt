class CreateConcernComments < ActiveRecord::Migration[5.2]
  def change
    create_table :concern_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :concern_id

      t.timestamps
    end
  end
end
