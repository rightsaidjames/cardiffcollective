class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :website, :string
    add_column :users, :company, :string
  end
end
