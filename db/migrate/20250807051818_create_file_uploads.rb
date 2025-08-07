class CreateFileUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploads do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :is_public
      t.string :shared_slug

      t.timestamps
    end
  end
end
