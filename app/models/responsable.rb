class Responsable < ActiveRecord::Base
	acts_as_authentic do |c|
    c.login_field = :email
  end
  	
	validates :nombre, :email, :presence => { 
	:message => 'no puede dejarlo en blanco' }
	validates :password, :confirmation => true
	
	has_many :tareas


	def to_s 
		self.nombre
	end

end
