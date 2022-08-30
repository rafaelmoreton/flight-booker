class ChangeFlightDateColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :date, :date
    remove_column :flights, :departure_time, :string
    add_column :flights, :datetime, :datetime
  end
end
