class AddPrefectureToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :prefecture, :integer
  end
end
