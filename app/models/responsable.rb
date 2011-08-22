class Responsable < ActiveRecord::Base
validates :nombre, :mail, :presence => { 
:message => 'no puede dejarlo en blanco' }
validates :mail, :format => {:with => 
/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
has_many :tareas
def to_s 
	self.nombre
end
end
