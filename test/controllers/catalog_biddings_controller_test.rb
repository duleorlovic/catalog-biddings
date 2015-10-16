require 'test_helper'

class CatalogBiddingsControllerTest < ActionController::TestCase
  setup do
    @catalog_bidding = catalog_biddings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalog_biddings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalog_bidding" do
    assert_difference('CatalogBidding.count') do
      post :create, catalog_bidding: { catalog_auction_id: @catalog_bidding.catalog_auction_id, offered_at: @catalog_bidding.offered_at, offered_price: @catalog_bidding.offered_price, user_id: @catalog_bidding.user_id }
    end

    assert_redirected_to catalog_bidding_path(assigns(:catalog_bidding))
  end

  test "should show catalog_bidding" do
    get :show, id: @catalog_bidding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalog_bidding
    assert_response :success
  end

  test "should update catalog_bidding" do
    patch :update, id: @catalog_bidding, catalog_bidding: { catalog_auction_id: @catalog_bidding.catalog_auction_id, offered_at: @catalog_bidding.offered_at, offered_price: @catalog_bidding.offered_price, user_id: @catalog_bidding.user_id }
    assert_redirected_to catalog_bidding_path(assigns(:catalog_bidding))
  end

  test "should destroy catalog_bidding" do
    assert_difference('CatalogBidding.count', -1) do
      delete :destroy, id: @catalog_bidding
    end

    assert_redirected_to catalog_biddings_path
  end
end
