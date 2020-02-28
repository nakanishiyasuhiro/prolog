require 'rails_helper'

describe ProgramminglogsController, type: :controller do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested programminglog to @programminglog" do
      programminglog = create(:programminglog)
      get :edit, params: { id: programminglog }
      expect(assigns(:programminglog)).to eq programminglog
    end

    it "renders the :edit template" do
      programminglog = create(:programminglog)
      get :edit, params: { id: programminglog }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of programminglogs ordered by created_at DESC" do
      programminglogs = create_list(:programminglog, 3) #programminglogのレコードを3つ保存した上で、そのインスタンスをprogramminglogsという変数に代入してる。
      get :index #indexアクションへの擬似的なリクエスト
      expect(assigns(:programminglogs)).to match(programminglogs.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  
end
