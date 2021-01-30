class CreateTimezones < ActiveRecord::Migration[5.2]
  def change
    create_table :timezones do |t|
      t.string :zone

      t.timestamps
    end
  end
end
