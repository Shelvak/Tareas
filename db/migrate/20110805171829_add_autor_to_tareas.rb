class AddAutorToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :autor, :text
  end

  def self.down
    remove_column :tareas, :autor
  end
end
