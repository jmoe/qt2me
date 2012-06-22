class AddOrdersPaymentToken < ActiveRecord::Migration
  def up
    add_column :orders, :payment_token,  :string
    add_column :orders, :amount_charged, :integer
  end

  def down
    remove_column :orders, :payment_token
    remove_column :orders, :amount_charged
  end
end
