class AddZoneToClock < ActiveRecord::Migration[5.2]
  def change
    add_column :clocks, :timezone, :string
  end
end
