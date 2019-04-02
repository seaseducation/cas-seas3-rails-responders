describe Api::PostsController, type: :controller do
  #let(:user) { users(:logan) }
  let(:user) { Fabricate(:user) }
  let(:post) { Fabricate(:post) }
  before { user.update token_expires_at: Time.current + 1.day }

  describe '?include=user' do
    it 'only returns the posts that have ids present in the ids parameter' do
      #get :show,id: posts(:logan)
      get :show, params: {id: post.id, format: :json}
      # TODO how to test w/o relying on AMS 0.10.0?
    end
  end
end
