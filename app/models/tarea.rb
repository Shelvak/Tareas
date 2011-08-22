class Tarea < ActiveRecord::Base
validates :nombre, :detalles, :autor, :presence => { 
:message => 'no puede dejarlo en blanco' }
validates :autor , :length => {:maximum => 15 }
validates :fecha, :timeliness => {
 :type => :date, 
 :invalid_date_message => 'esta mal formada' }
validates :fecha, :on => :create, :timeliness => {
:type => :date,
:on_or_after => :today,
:on_or_after_message => 'debe ser para hoy o el futuro'
 }
validates_each :nombre do |record, attr, value|
	if value.to_s[0] == 'z'
   record.errors.add attr, 'inicia con z'
	end
end
belongs_to :responsable
end