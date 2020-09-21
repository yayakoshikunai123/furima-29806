class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image
      t.string :text
      t.text :message
      t.timestamps
    end
  end
end