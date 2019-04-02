describe Api::PostsController, type: :controller  do
  let(:user) { Fabricate(:user) }
  let(:post) { Fabricate(:post) }
  before { user.update token_expires_at: Time.current + 1.day }

  describe 'pagination' do
    before do
      20.times { user.posts.create title: 'Title', body: 'Body' }
    end

    it 'does not paginate by default' do
      get :index, params: {user_id: user, format: :json}
      expect(json.size).to be user.posts.size
    end

    it 'paginates when the page parameters are sent' do
      get :index, params: {user_id: user, page: 2, limit: 5, format: :json}
      expect(json.size).to be 5
      ids = json.map { |h| h[:id] }
      expect(ids).to eq user.posts.limit(5).offset(5).pluck(:id)
    end

    it 'returns an error message when the page param is present but the limit param isnt' do
      get :index, params: {user_id: user, page: 1, format: :json}
      expect(response.status).to eq 400
      expect(json[:errors]).to include "The 'page' param was sent without 'limit'"
    end

    it 'returns an error message when the limit param is present but the page param isnt' do
      get :index, params: {user_id: user, limit: 20, format: :json}
      expect(json[:errors]).to include "The 'limit' param was sent without 'page'"
    end

    it 'has a link header for next' do
      get :index, params: {user_id: user, page: 1, limit: 5, format: :json}
      expect(response.headers['Link']).to match %r[api/posts\?limit=5&page=2(.*)?\srel="next"]
    end

    it 'has a link header for last' do
      get :index, params: {user_id: user, page: 1, limit: 5, format: :json}
      #byebug
      #expect(response.headers['Link']).to match %r[http://test.host/api/posts\?limit=5&page=5(.*)?\srel="last"]
      expect(response.headers['Link']).to match /<http:\/\/test\.host\/api\/posts\?limit=\d&page=4&user_id=\d+[>\;\s]+rel=\"last\"/
    end
  end
end