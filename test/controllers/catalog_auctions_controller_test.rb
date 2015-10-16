require 'test_helper'

class CatalogAuctionsControllerTest < ActionController::TestCase
  setup do
    @catalog_auction = catalog_auctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalog_auctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalog_auction" do
    assert_difference('CatalogAuction.count') do
      post :create, catalog_auction: { catalog_id: @catalog_auction.catalog_id, expires_at: @catalog_auction.expires_at, initial_price: @catalog_auction.initial_price, is_active: @catalog_auction.is_active }
    end

    assert_redirected_to catalog_auction_path(assigns(:catalog_auction))
  end

  test "should show catalog_auction" do
    get :show, id: @catalog_auction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalog_auction
    assert_response :success
  end

  test "should update catalog_auction" do
    patch :update, id: @catalog_auction, catalog_auction: { catalog_id: @catalog_auction.catalog_id, expires_at: @catalog_auction.expires_at, initial_price: @catalog_auction.initial_price, is_active: @catalog_auction.is_active }
    assert_redirected_to catalog_auction_path(assigns(:catalog_auction))
  end

  test "should destroy catalog_auction" do
    assert_difference('CatalogAuction.count', -1) do
      delete :destroy, id: @catalog_auction
    end

    assert_redirected_to catalog_auctions_path
  end
end
