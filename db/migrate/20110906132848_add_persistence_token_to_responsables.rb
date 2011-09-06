class AddPersistenceTokenToResponsables < ActiveRecord::Migration
  def self.up
    add_column :responsables, :persistence_token, :string
  end

  def self.down
    remove_column :responsables, :persistence_token
  end
end
