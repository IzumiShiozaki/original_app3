require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get japanese" do
    get subjects_japanese_url
    assert_response :success
  end

  test "should get socialstudies" do
    get subjects_socialstudies_url
    assert_response :success
  end

  test "should get math" do
    get subjects_math_url
    assert_response :success
  end

  test "should get science" do
    get subjects_science_url
    assert_response :success
  end

  test "should get english" do
    get subjects_english_url
    assert_response :success
  end

end
