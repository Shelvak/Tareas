class AddPasword_SaltToResponsables < ActiveRecord::Migration
  def self.up
    add_column :responsables, :password_salt, :string
  end

  def self.down
    remove_column :responsables, :password_salt
  end
end
