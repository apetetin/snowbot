class AddFlatUrlToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :flat_url, :string
  end
end
