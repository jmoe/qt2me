class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.string :sender_email,      :nil => false
      t.string :sender_name,       :nil => false
      t.string :recipient_name,    :nil => false
      t.string :recipient_address, :nil => false
      t.string :recipient_city,    :nil => false
      t.string :recipient_state,   :nil => false
      t.string :recipient_postal,  :nil => false
    end
  end

  def down
    drop_table :orders
  end
end
