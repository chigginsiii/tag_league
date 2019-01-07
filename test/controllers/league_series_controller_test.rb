require 'test_helper'

class LeagueSeriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @league_series = league_series(:one)
  end

  test "should get index" do
    get league_series_index_url, as: :json
    assert_response :success
  end

  test "should create league_series" do
    assert_difference('LeagueSeries.count') do
      post league_series_index_url, params: { league_series: { belongs_to: @league_series.belongs_to, date_end: @league_series.date_end, date_start: @league_series.date_start, title: @league_series.title } }, as: :json
    end

    assert_response 201
  end

  test "should show league_series" do
    get league_series_url(@league_series), as: :json
    assert_response :success
  end

  test "should update league_series" do
    patch league_series_url(@league_series), params: { league_series: { belongs_to: @league_series.belongs_to, date_end: @league_series.date_end, date_start: @league_series.date_start, title: @league_series.title } }, as: :json
    assert_response 200
  end

  test "should destroy league_series" do
    assert_difference('LeagueSeries.count', -1) do
      delete league_series_url(@league_series), as: :json
    end

    assert_response 204
  end
end
