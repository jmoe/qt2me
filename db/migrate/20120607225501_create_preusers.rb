class CreatePreusers < ActiveRecord::Migration
  def up
    create_table :preusers, :force => true do |t|
      t.string :email, :required => true
    end
  end

  def down
    drop_table :preusers
  end
end