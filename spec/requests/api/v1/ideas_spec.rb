require 'rails_helper'

RSpec.describe 'Ideas', type: :request do
  before do
    @category = FactoryBot.create(:category)
    @idea = FactoryBot.create(:idea)
  end

  describe 'IdeaAPI' do
    it 'ideaの登録に成功するとステータスコード201が返ってくる' do
      valid_params = { name: 'スポーツ', body: 'サッカー' }
      expect do
        post '/api/v1/categories/:category_id/ideas', params: { post: valid_params }
      end.to change(Idea, :count).by(+1)
      expect(response.status).to eq(201)
    end

    it 'ideaの登録に失敗するとステータスコード422が返ってくる' do
      valid_params = {name: 'スポーツ', body: 'サッカー' }
      expect do
        post '/api/v1/categories/:category_id/ideas', params: { post: valid_params }
      end.to change(Idea, :count).by(0)
      expect(response.status).to eq(422)
    end

    it '特定のideaを取得する' do
      idea = FactoryBot.create(:idea, body: 'サッカー')
      get '/api/v1/categories/:category_id/ideas'
      json = JSON.parse(response.body)
      expect(response.status).to eq(201)
      expect(json['data']['body']).to eq(idea.body)
    end

    it '全てのideaを取得する' do
      FactoryBot.create_list(:idea, 10)
      get '//api/v1/categories/:category_id/ideas'
      json = JSON.parse(response.body)
      expect(response.status).to eq(201)
      expect(json['data'].length).to eq(10)
    end
  end
end
