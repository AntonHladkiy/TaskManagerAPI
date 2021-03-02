require 'rails_helper'

RSpec.describe 'POST /api/v1/users', type: :request do

  let(:url) { '/api/v1/users' }
  let(:params) do
    {
        email: "test@gmail.com",
        password: "password"
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end
end
