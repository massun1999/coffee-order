require 'test_helper'

class LattesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @latte = lattes(:one)
  end

  test "should get index" do
    get lattes_url
    assert_response :success
  end

  test "should get new" do
    get new_latte_url
    assert_response :success
  end

  test "should create latte" do
    assert_difference('Latte.count') do
      post lattes_url, params: { latte: {  } }
    end

    assert_redirected_to latte_url(Latte.last)
  end

  test "should show latte" do
    get latte_url(@latte)
    assert_response :success
  end

  test "should get edit" do
    get edit_latte_url(@latte)
    assert_response :success
  end

  test "should update latte" do
    patch latte_url(@latte), params: { latte: {  } }
    assert_redirected_to latte_url(@latte)
  end

  test "should destroy latte" do
    assert_difference('Latte.count', -1) do
      delete latte_url(@latte)
    end

    assert_redirected_to lattes_url
  end
end
