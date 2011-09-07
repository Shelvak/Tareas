require 'test_helper'
include Authlogic::TestCase
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
	
	test 'el email no puede estar en blanco' do
	@responsable.email = ' '
	assert @responsable.invalid?
  p @responsable.errors.full_messages
	assert_equal 4, @responsable.errors.size
	assert_equal [error_message_from_model(@responsable, :email)].sort, @responsable.errors[:email].sort
	#assert_equal [:authlogic.error_messages.email_invalid].sort, @responsable.errors[:email]
  end  
  
  test 'probando password' do
  @responsable.password = 'asd1234'
  @responsable.password_confirmation = 'asd1235'
  assert @responsable.invalid?
  p @responsable.errors.full_messages
  assert_equal 2, @responsable.errors.size
  assert_equal [error_message_from_model(@responsable, :password, :confirmation)],
    @responsable.errors[:password]
  end
end
