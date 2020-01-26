require 'test_helper'

class MerchantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get merchants_url
    assert_response :success
  end

  test "should get new" do
    get new_merchant_url
    assert_response :success
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post merchants_url, params: { merchant: { description: @merchant.description, fee: @merchant.fee, title: @merchant.title, user_id: @merchant.user_id } }
    end

    assert_redirected_to merchant_url(Merchant.last)
  end

  test "should show merchant" do
    get merchant_url(@merchant)
    assert_response :success
  end

  test "should get edit" do
    get edit_merchant_url(@merchant)
    assert_response :success
  end

  test "should update merchant" do
    patch merchant_url(@merchant), params: { merchant: { description: @merchant.description, fee: @merchant.fee, title: @merchant.title, user_id: @merchant.user_id } }
    assert_redirected_to merchant_url(@merchant)
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete merchant_url(@merchant)
    end

    assert_redirected_to merchants_url
  end
end
