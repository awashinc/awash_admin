require 'test_helper'

class Admin::StatusesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Status.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Status.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Status.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_status_url(assigns(:status))
  end

  def test_edit
    get :edit, :id => Status.first
    assert_template 'edit'
  end

  def test_update_invalid
    Status.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Status.first
    assert_template 'edit'
  end

  def test_update_valid
    Status.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Status.first
    assert_redirected_to admin_status_url(assigns(:status))
  end

  def test_destroy
    status = Status.first
    delete :destroy, :id => status
    assert_redirected_to admin_statuses_url
    assert !Status.exists?(status.id)
  end
end
