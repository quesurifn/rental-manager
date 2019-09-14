class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string, :name
      t.string, :address1
      t.string, :address2
      t.string, :city
      t.string, :state
      t.float, :purchase_price
      t.float :rental_price

      t.timestamps
    end
  end
end
