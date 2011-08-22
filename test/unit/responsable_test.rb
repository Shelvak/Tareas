require 'test_helper'

class ResponsableTest < ActiveSupport::TestCase
 fixtures :responsables
 def setup
   @responsable = Responsable.find(responsables(:rock_in_rio).id)
 end
 
	test 'el nombre no puede estar en blanco' do
	@responsable.nombre = ''
	assert @responsable.invalid?
	assert_equal 1, @responsable.errors.size
	assert_equal 'no puede dejarlo en blanco', @responsable.errors[:nombre][0]
	end  
	
	test 'el mail esta vacio' do
	@responsable.mail = ''
	assert @responsable.invalid?
	assert_equal 2, @responsable.errors.size
	assert_equal ['no puede dejarlo en blanco','es inválido'].sort, @responsable.errors[:mail].sort
	end  
end
