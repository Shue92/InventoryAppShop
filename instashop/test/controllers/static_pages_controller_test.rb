require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | MY Insta_shop"
  end

  test "should get inventory" do
    get :inventory
    assert_response :success
    assert_select "title", "Inventory | MY Insta_shop"
  end

  test "should get order" do
    get :order
    assert_response :success
    assert_select "title", "Order | MY Insta_shop"
  end

end
