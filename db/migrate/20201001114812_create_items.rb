class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t| 
      t.integer       :user_id                 , null:false , foreign_key:true
      t.text          :image                   , null:false
      t.text          :expanation              , null:false 
      t.integer       :category_id             , null:false
      t.string        :product_name            , null:false
      t.integer       :price                   , null:false
      t.integer       :product_status_id       , null:false
      t.integer       :shipping_fee_burden_id  , null:false
      t.integer       :shipping_source_area_id , null:false
      t.integer       :shipping_days_id        , null:false
      t.timestamps
    end
  end
end
