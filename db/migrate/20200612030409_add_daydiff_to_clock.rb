class AddDaydiffToClock < ActiveRecord::Migration[5.2]
  def change
    add_column :clocks, :daydiff, :string
  end
end
