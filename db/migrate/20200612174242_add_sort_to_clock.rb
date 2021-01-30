class AddSortToClock < ActiveRecord::Migration[5.2]
  def change
    add_column :clocks, :sort, :integer
  end
end
