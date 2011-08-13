class Tarea < ActiveRecord::Base
validates :nombre, :detalles, :autor, :presence => { :message => 'no puede dejarlo en blanco.'}
validates :autor , :length => {:maximum => 15 }
validates_each :nombre do |record, attr, value|
	if value.to_s[0] == 'z'
   record.errors.add attr, 'inicia con z'
	end
end
end
