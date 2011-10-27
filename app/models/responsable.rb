#encoding: UTF-8
class Responsable < ActiveRecord::Base
	acts_as_authentic do |c|
    c.login_field = :email
  end
  	
	validates :nombre, :presence => { 
	:message => 'no puede dejarlo en blanco' }
	
	has_many :tareas
  scope :con_nombre, lambda { |nombre| where('LOWER(nombre) LIKE ?', "#{nombre}%".downcase) }

	def to_s 
		self.nombre
	end
  
  

end
