require File.dirname(__FILE__) + '/../test_helper'

class EmailsControllerTest < ActionController::TestCase
    fixtures :emails
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:emails_important)
	assert_not_nil assigns(:emails_ordinary)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_email
    assert_difference('Email.count') do
      post :create, :email => { :address=>emails(:right).address}
    end

    assert_redirected_to email_path(assigns(:email))
  end

  def test_should_show_email
    get :show, :id => emails(:right).id
    assert_response :success
    get :show, :id => emails(:wrong).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => emails(:right).id
    assert_response :success
  end

  def test_should_update_email

    put :update, :id => emails(:right).id, :email => { }
    assert_redirected_to email_path(assigns(:email))

    put :update, :id => emails(:wrong).id, :email => { }
    assert_response :success

	end

  def test_should_destroy_email
    assert_difference('Email.count', -1) do
      delete :destroy, :id => emails(:right).id
    end

    assert_response :success
  end
#=end
end
