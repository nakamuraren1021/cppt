class CreateConcerns < ActiveRecord::Migration[5.2]
  def change
    create_table :concerns do |t|
      t.string :image
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
