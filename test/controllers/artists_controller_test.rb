require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  setup do
    @artist = artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post :create, artist: { art_piece: @artist.art_piece, art_piece_price: @artist.art_piece_price, email: @artist.email, name: @artist.name, password_hash: @artist.password_hash, place: @artist.place, wepay_access_token: @artist.wepay_access_token, wepay_account_id: @artist.wepay_account_id }
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should show artist" do
    get :show, id: @artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist
    assert_response :success
  end

  test "should update artist" do
    patch :update, id: @artist, artist: { art_piece: @artist.art_piece, art_piece_price: @artist.art_piece_price, email: @artist.email, name: @artist.name, password_hash: @artist.password_hash, place: @artist.place, wepay_access_token: @artist.wepay_access_token, wepay_account_id: @artist.wepay_account_id }
    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end

    assert_redirected_to artists_path
  end
end
