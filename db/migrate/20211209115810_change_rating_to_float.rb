class ChangeRatingToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :rating, :decimal
  end
end
