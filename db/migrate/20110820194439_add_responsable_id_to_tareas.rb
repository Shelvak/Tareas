class AddResponsableIdToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :responsable_id, :integer
  end

  def self.down
    remove_column :tareas, :responsable_id
  end
end
