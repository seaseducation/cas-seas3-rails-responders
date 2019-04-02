describe 'API version constraints', type: :request do
  #let(:user) { users(:logan) }
  let!(:user) { Fabricate(:user)}

  it 'routes properly without a version because the current version is 1' do
    get '/api/posts', params: {user_id: user.id}
    expect(response).to be_successful
  end

  it 'routes properly when version is set to the current version' do
    get '/api/posts', params: { user_id: user.id, 'HTTP_ACCEPT' => 'application/json; version=1' }
    expect(response).to be_successful
  end
end