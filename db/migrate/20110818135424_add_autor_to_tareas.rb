class AddAutorToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :autor, :string
  end

  def self.down
    remove_column :tareas, :autor
  end
end
