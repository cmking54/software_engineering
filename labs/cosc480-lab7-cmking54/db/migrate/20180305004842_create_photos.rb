class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :caption
      t.attachment :image
      t.references :sight, foreign_key: true

      t.timestamps
    end
  end
end
