class RemoveUserIdFromConcerns < ActiveRecord::Migration[5.2]
  def change
    remove_column :concerns, :user_id, :string
  end
end
