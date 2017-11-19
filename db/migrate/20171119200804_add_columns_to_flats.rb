class AddColumnsToFlats < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :zip_code, :integer
    add_column :flats, :city, :string
    add_column :flats, :country, :string
  end
end
