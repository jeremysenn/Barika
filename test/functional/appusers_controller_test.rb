require 'test_helper'

class AppusersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Appuser.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Appuser.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Appuser.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to appuser_url(assigns(:appuser))
  end

  def test_edit
    get :edit, :id => Appuser.first
    assert_template 'edit'
  end

  def test_update_invalid
    Appuser.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Appuser.first
    assert_template 'edit'
  end

  def test_update_valid
    Appuser.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Appuser.first
    assert_redirected_to appuser_url(assigns(:appuser))
  end

  def test_destroy
    appuser = Appuser.first
    delete :destroy, :id => appuser
    assert_redirected_to appusers_url
    assert !Appuser.exists?(appuser.id)
  end
end
