class AddCrypted_PasswordToResponsables < ActiveRecord::Migration
  def self.up
    add_column :responsables, :crypted_password, :string
  end

  def self.down
    remove_column :responsables, :crypsted_password
  end
end
