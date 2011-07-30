require 'test_helper'

class TareaTest < ActiveSupport::TestCase
  # Replace this with your real tests.
fixtures :tareas
 def setup
   @tarea = Tarea.find(tareas(:ir_al_curso).id)
 end
 
	test 'el nombre no puede estar en blanco' do
	@tarea.nombre = ''
	assert @tarea.invalid?
	assert_equal 1, @tarea.errors.size
	assert_equal "can't be blank", @tarea.errors[:nombre][0]
	end  
	test 'el detalle no puede estar en blanco' do
	@tarea.detalles = ''
	assert @tarea.invalid?
	assert_equal 1, @tarea.errors.size
	assert_equal(
	"can't be blank",
	@tarea.errors[:detalles][0]
	)
	end

end
