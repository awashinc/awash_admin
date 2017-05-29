require 'test_helper'

class Admin::WashingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Washing.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Washing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Washing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_washing_url(assigns(:washing))
  end

  def test_edit
    get :edit, :id => Washing.first
    assert_template 'edit'
  end

  def test_update_invalid
    Washing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Washing.first
    assert_template 'edit'
  end

  def test_update_valid
    Washing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Washing.first
    assert_redirected_to admin_washing_url(assigns(:washing))
  end

  def test_destroy
    washing = Washing.first
    delete :destroy, :id => washing
    assert_redirected_to admin_washings_url
    assert !Washing.exists?(washing.id)
  end
end
