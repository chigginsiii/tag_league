require "rails_helper"

# The authentication header looks something like this:
# {
#   "access-token"=>"abcd1dMVlvW2BT67xIAS_A",
#   "token-type"=>"Bearer",
#   "client"=>"LSJEVZ7Pq6DX5LXvOWMq1w",
#   "expiry"=>"1519086891",
#   "uid"=>"darnell@konopelski.info"
# }

RSpec.describe "Whether access is ocurring properly", type: :request do
  before do
    @current_user = FactoryBot.create(:user)
    @event = FactoryBot.create :series_event
  end

  context "with  general authentication" do
    # start with getting the PlayerEvent for this event api_v1_series_event_checkin_path(series_event_id)
    it "doesn't give you anything if you don't log in" do
      post api_v1_series_event_checkin_path(@event.id)
      expect(response.status).to eq(401)
    end

    it "gives you a status 200 on signing in " do
      login
      expect(response.status).to eq(200)
    end

    it "gives you an authentication code if you are an existing user and you satisfy the password" do
      login
      expect(response.has_header?("access-token")).to eq(true)
    end

    it "first get a token, then access a restricted page" do
      login
      auth_params = get_auth_params_from_login_response_headers(response)
      new_event = FactoryBot.create(:series_event)
      post api_v1_series_event_checkin_path(new_event.id), headers: auth_params
      expect(response).to have_http_status(:success)
    end

    it "deny access to a restricted page with an incorrect token" do
      login
      auth_params = get_auth_params_from_login_response_headers(response).tap do |h|
        h.each do |k, _v|
          h[k] = "123" if k == "access-token"
        end
      end
      new_event = FactoryBot.create(:series_event)
      post api_v1_series_event_checkin_path(new_event.id), headers: auth_params
      expect(response).not_to have_http_status(:success)
    end
  end

  RSpec.shared_examples "use authentication tokens of different ages" do |token_age, http_status|
    let(:vary_authentication_age) { token_age }

    it "uses the given parameter" do
      expect(vary_authentication_age(token_age)).to have_http_status(http_status)
    end

    # rubocop:disable Metrics/AbcSize
    def vary_authentication_age(token_age)
      login
      auth_params = get_auth_params_from_login_response_headers(response)
      new_event = FactoryBot.create(:series_event)
      post api_v1_series_event_checkin_path(new_event.id), headers: auth_params
      expect(response).to have_http_status(:success)

      allow(Time).to receive(:now).and_return(Time.now + token_age)

      post api_v1_series_event_checkin_path(new_event.id), headers: auth_params
      response
    end
    # rubocop:enable Metrics/AbcSize
  end

  context "with access tokens of varying ages" do
    include_examples "use authentication tokens of different ages", 2.days, :success
    include_examples "use authentication tokens of different ages", 5.years, :unauthorized
  end

  def login
    post api_v1_user_session_path,
      params: { email: @current_user.email, password: "password" }.to_json,
      headers: { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }
  end

  # rubocop:disable Metrics/MethodLength
  def get_auth_params_from_login_response_headers(response)
    client = response.headers["client"]
    token = response.headers["access-token"]
    expiry = response.headers["expiry"]
    token_type = response.headers["token-type"]
    uid = response.headers["uid"]

    auth_params = {
      "access-token" => token,
      "client" => client,
      "uid" => uid,
      "expiry" => expiry,
      "token_type" => token_type
    }
    auth_params
  end
  # rubocop:enable Metrics/MethodLength
end
