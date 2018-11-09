require 'test_helper'

class FfnisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ffni = ffnis(:one)
  end

  test "should get index" do
    get ffnis_url
    assert_response :success
  end

  test "should get new" do
    get new_ffni_url
    assert_response :success
  end

  test "should create ffni" do
    assert_difference('Ffni.count') do
      post ffnis_url, params: { ffni: { badge: @ffni.badge, content: @ffni.content, downvotes: @ffni.downvotes, media: @ffni.media, topic: @ffni.topic, upvotes: @ffni.upvotes, user_id: @ffni.user_id } }
    end

    assert_redirected_to ffni_url(Ffni.last)
  end

  test "should show ffni" do
    get ffni_url(@ffni)
    assert_response :success
  end

  test "should get edit" do
    get edit_ffni_url(@ffni)
    assert_response :success
  end

  test "should update ffni" do
    patch ffni_url(@ffni), params: { ffni: { badge: @ffni.badge, content: @ffni.content, downvotes: @ffni.downvotes, media: @ffni.media, topic: @ffni.topic, upvotes: @ffni.upvotes, user_id: @ffni.user_id } }
    assert_redirected_to ffni_url(@ffni)
  end

  test "should destroy ffni" do
    assert_difference('Ffni.count', -1) do
      delete ffni_url(@ffni)
    end

    assert_redirected_to ffnis_url
  end
end
