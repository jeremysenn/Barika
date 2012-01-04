require 'test_helper'

class ChartsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Chart.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Chart.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Chart.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to chart_url(assigns(:chart))
  end

  def test_edit
    get :edit, :id => Chart.first
    assert_template 'edit'
  end

  def test_update_invalid
    Chart.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Chart.first
    assert_template 'edit'
  end

  def test_update_valid
    Chart.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Chart.first
    assert_redirected_to chart_url(assigns(:chart))
  end

  def test_destroy
    chart = Chart.first
    delete :destroy, :id => chart
    assert_redirected_to charts_url
    assert !Chart.exists?(chart.id)
  end
end
