require 'test_helper'

class Admin::CarManufacturersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CarManufacturer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CarManufacturer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CarManufacturer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_car_manufacturer_url(assigns(:car_manufacturer))
  end

  def test_edit
    get :edit, :id => CarManufacturer.first
    assert_template 'edit'
  end

  def test_update_invalid
    CarManufacturer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CarManufacturer.first
    assert_template 'edit'
  end

  def test_update_valid
    CarManufacturer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CarManufacturer.first
    assert_redirected_to admin_car_manufacturer_url(assigns(:car_manufacturer))
  end

  def test_destroy
    car_manufacturer = CarManufacturer.first
    delete :destroy, :id => car_manufacturer
    assert_redirected_to admin_car_manufacturers_url
    assert !CarManufacturer.exists?(car_manufacturer.id)
  end
end
