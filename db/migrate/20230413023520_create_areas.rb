class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      
      t.integer :user_id,    null: false
      t.string :area_name,   null: false
      t.string :address,     null: false
      t.integer :facilities, null: false
      t.boolean :handrail,   null: false, default: false
      t.boolean :washlet,    null: false, default: false
      t.string :open_time,   null: false
      t.string :close_time,  null: false

      t.timestamps
    end
  end
end
