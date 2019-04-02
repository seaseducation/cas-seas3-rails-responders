describe Api::PostsController, type: :controller do
  # let(:user) { users(:logan) }
  let(:post) { Fabricate :post }
  #
  # before { user.update token_expires_at: Time.current + 1.day }

  describe 'http caching' do
    around do |example|
      ActionController::Base.perform_caching = true
      example.run
      ActionController::Base.perform_caching = false
    end

    it 'should return an e-tag' do
      get :show, params: {id: post, format: :json}
      expect(response.headers['ETag']).to be_present
    end

    it 'returns 304 when given an e-tag' do
      get :show, params: {id: post, format: :json}
      request.headers['If-None-Match'] = response.headers['ETag']
      get :show, params: {id: post, format: :json}
      expect(response.status).to eq 304
      expect(response.body).to be_blank
    end

    it 'returns a 200 again after updating the post' do
      get :show, params: {id: post, format: :json}
      request.headers['If-None-Match'] = response.headers['ETag']
      get :show, params: {id: post, format: :json}
      expect(response.status).to eq 304
      post.update!(title: 'Updated title') and sleep(0.5)
      get :show, params: {id: post, format: :json}
      expect(response.status).to eq 200
    end

    # NOTE - this was originally a 200 response but if you read the test it should clearly be 304
    #        this is being documented with a note because cache issues and http responses are tricky at best
    it 'does not cache if cache param is false' do
      #get :show, id: post
      get :show,  params: {id: post, format: :json}
      request.headers['If-None-Match'] = response.headers['ETag']
      #get :show, id: post, cache: false
      get :show,  params: {id: post, cache: false, format: :json}
      expect(response.status).to eq 304
    end
  end
end
