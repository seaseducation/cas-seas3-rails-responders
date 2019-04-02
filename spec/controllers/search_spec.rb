describe Api::PostsController, type: :controller  do
  # logan:
  #   user: logan
  #   title: Hey
  #   body: This is a post
  #
  # a:
  #   user: logan
  #   title: AAA
  #   body: Aaaa aaa aa a
  #
  # b:
  #   user: logan
  #   title: BBB
  #   body: Bbbb bbb bb b
  #
  # c:
  #   user: logan
  #   title: CCC
  #   body: Cccc ccc cc c

  let(:user) { Fabricate :user }
  before { user.update token_expires_at: Time.current + 1.day }

  let!(:post_logan) { Fabricate :post, user_id: user.id, title: "Hey", body: "This is a post" }
  let!(:post_a) { Fabricate :post, user_id: user.id, title: "AAA", body: "Aaaa aaa aa a" }
  let!(:post_b) { Fabricate :post, user_id: user.id, title: "BBB", body: "Bbbb bbb bb b" }
  let!(:post_c) { Fabricate :post, user_id: user.id, title: "CCC", body: "Cccc ccc cc c" }

  describe 'searching' do
    it 'searches based on any text column' do
      get :index, params: {user_id: user, search: { query: 'AA' }, format: :json}
      expect(json.size).to eq 1
      expect(json[0]['title']).to eq 'AAA'
    end

    it 'searches based on a specific column' do
      get :index, params: {user_id: user, search: { query: { body: 'Aaa' } }, format: :json}
      expect(json.size).to eq 1
      expect(json[0]['title']).to eq 'AAA'
    end

    it 'supports OR operator on separate fields' do
      get :index, params: {user_id: user, search: { query: { body: 'Aaa', title: 'BBB' }, _operator: 'or' }, format: :json}
      expect(json.size).to eq 2
      expect(json[0]['title']).to eq 'AAA'
      expect(json[1]['title']).to eq 'BBB'
    end
  end
end