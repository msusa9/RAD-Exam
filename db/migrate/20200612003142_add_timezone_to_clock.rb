class AddTimezoneToClock < ActiveRecord::Migration[5.2]
  def change
    add_column :clocks, :zone, :string
  end
end
