class AddCarUrlToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :car_url, :string
  end
end
