require 'test_helper'

class Admin::WashingCommentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => WashingComment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    WashingComment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    WashingComment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_washing_comment_url(assigns(:washing_comment))
  end

  def test_edit
    get :edit, :id => WashingComment.first
    assert_template 'edit'
  end

  def test_update_invalid
    WashingComment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WashingComment.first
    assert_template 'edit'
  end

  def test_update_valid
    WashingComment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WashingComment.first
    assert_redirected_to admin_washing_comment_url(assigns(:washing_comment))
  end

  def test_destroy
    washing_comment = WashingComment.first
    delete :destroy, :id => washing_comment
    assert_redirected_to admin_washing_comments_url
    assert !WashingComment.exists?(washing_comment.id)
  end
end
