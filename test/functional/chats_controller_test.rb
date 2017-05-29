require 'test_helper'

class ChatsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Chat.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Chat.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Chat.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to chat_url(assigns(:chat))
  end

  def test_edit
    get :edit, :id => Chat.first
    assert_template 'edit'
  end

  def test_update_invalid
    Chat.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Chat.first
    assert_template 'edit'
  end

  def test_update_valid
    Chat.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Chat.first
    assert_redirected_to chat_url(assigns(:chat))
  end

  def test_destroy
    chat = Chat.first
    delete :destroy, :id => chat
    assert_redirected_to chats_url
    assert !Chat.exists?(chat.id)
  end
end
