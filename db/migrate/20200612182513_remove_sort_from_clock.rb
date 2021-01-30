class RemoveSortFromClock < ActiveRecord::Migration[5.2]
  def change
    remove_column :clocks, :sort, :integer
  end
end
