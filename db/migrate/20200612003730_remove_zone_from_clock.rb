class RemoveZoneFromClock < ActiveRecord::Migration[5.2]
  def change
    remove_column :clocks, :zone, :string
  end
end
