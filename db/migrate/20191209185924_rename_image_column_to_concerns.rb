class RenameImageColumnToConcerns < ActiveRecord::Migration[5.2]
  def change
  	rename_column :concerns, :image, :image_id
  end
end
