require 'test_helper'

class FlujosResponsableTest < ActionDispatch::IntegrationTest
  fixtures :all
test 'ingresar y ver tareas y responsables' do
    get '/responsable_sessions/new'
    
    post_via_redirect '/responsable_sessions/new', {
      :email => 'nestorcoppi@gmail.com',
      :password => '12452'
    }
    assert_equal '/tareas', path
 
   get '/responsables'
   assert_response :success
   assert assigns(:responsables)
end


end
