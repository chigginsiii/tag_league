require "rails_helper"

RSpec.describe Api::V1::SeriesEventsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # SeriesEvent. As you add validations to SeriesEvent, be sure to
  # adjust the attributes here as well.
  let(:league_series) { create(:league_series) }
  let(:valid_attributes) do
    {
      league_series_id: league_series.id,
      title: "test event",
      event_start_time: Time.now,
      event_end_time: Time.now + 1.day
    }
  end

  let(:invalid_attributes) do
    {
      league_series_id: league_series.id,
      title: "bad params",
      event_start_time: Time.now + 1.day,
      event_end_time: Time.now
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SeriesEventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      SeriesEvent.create! valid_attributes
      get :index, params: { league_id: league_series.league_id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      series_event = SeriesEvent.create! valid_attributes
      get :show, params: { id: series_event.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  # describe 'POST #create' do
  #   context 'with valid params' do
  #     it 'creates a new SeriesEvent' do
  #       expect do
  #         post :create,
  #           params: { league_id: league_series.league_id, series_event: valid_attributes },
  #           session: valid_session
  #       end.to change(SeriesEvent, :count).by(1)
  #     end

  #     it 'renders a JSON response with the new series_event' do
  #       post :create,
  #         params: { league_id: league_series.league_id, series_event: valid_attributes },
  #         session: valid_session
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json')
  #       expect(response.location).to eq(series_event_url(SeriesEvent.last))
  #     end
  #   end

  #   context 'with invalid params' do
  #     it 'renders a JSON response with errors for the new series_event' do
  #       post :create,
  #         params: { league_id: league_series.league_id, series_event: invalid_attributes },
  #         session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe 'PUT #update' do
  #   context 'with valid params' do
  #     let(:new_attributes) do
  #       { event_start_time: Time.now - 4.hours, event_end_time: Time.now + 4.hours }
  #     end

  #     it 'updates the requested series_event' do
  #       series_event = SeriesEvent.create! valid_attributes
  #       put :update, params: { id: series_event.to_param, series_event: new_attributes }, session: valid_session
  #       series_event.reload
  #       actual = series_event.event_start_time.strftime('%F %T')
  #       expected = new_attributes[:event_start_time].utc.strftime('%F %T')
  #       expect(actual).to eq expected
  #     end

  #     it 'renders a JSON response with the series_event' do
  #       series_event = SeriesEvent.create! valid_attributes

  #       put :update, params: { id: series_event.to_param, series_event: valid_attributes }, session: valid_session
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end

  #   context 'with invalid params' do
  #     it 'renders a JSON response with errors for the series_event' do
  #       series_event = SeriesEvent.create! valid_attributes

  #       put :update, params: { id: series_event.to_param, series_event: invalid_attributes }, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'destroys the requested series_event' do
  #     series_event = SeriesEvent.create! valid_attributes
  #     expect do
  #       delete :destroy, params: { id: series_event.to_param }, session: valid_session
  #     end.to change(SeriesEvent, :count).by(-1)
  #   end
  # end
end
