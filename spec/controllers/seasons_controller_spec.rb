require 'spec_helper'

describe SeasonsController do

  let(:valid_attributes) { { 'name' => 'MyString' } }
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all seasons as @seasons' do
      season = FactoryGirl.create(:season)
      get :index, {}, valid_session
      assigns(:seasons).should eq([season])
    end
  end

  describe 'GET show' do
    it 'assigns the requested season as @season' do
      season = FactoryGirl.create(:season)
      get :show, { id: season.to_param }, valid_session
      assigns(:season).should eq(season)
    end
  end

  describe 'GET new' do
    it 'assigns a new season as @season' do
      get :new, {}, valid_session
      assigns(:season).should be_a_new(Season)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested season as @season' do
      season = FactoryGirl.create(:season)
      get :edit, { id: season.to_param }, valid_session
      assigns(:season).should eq(season)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Season' do
        expect do
          post :create, { season: valid_attributes }, valid_session
        end.to change(Season, :count).by(1)
      end

      it 'assigns a newly created season as @season' do
        post :create, { season: valid_attributes }, valid_session
        assigns(:season).should be_a(Season)
        assigns(:season).should be_persisted
      end

      it 'redirects to the created season' do
        post :create, { season: valid_attributes }, valid_session
        response.should redirect_to(Season.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved season as @season' do
        # Trigger the behavior that occurs when invalid params are submitted
        Season.any_instance.stub(:save).and_return(false)
        post :create, { season: { 'name' => 'invalid value' } }, valid_session
        assigns(:season).should be_a_new(Season)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Season.any_instance.stub(:save).and_return(false)
        post :create, { season: { 'name' => 'invalid value' } }, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      it 'updates the requested season' do
        season = FactoryGirl.create(:season)
        Season.any_instance.should_receive(:update).with('name' => 'MyString')
        put :update, { id: season.to_param, season: { 'name' => 'MyString' } }, valid_session
      end

      it 'assigns the requested season as @season' do
        season = FactoryGirl.create(:season)
        put :update, { id: season.to_param, season: valid_attributes }, valid_session
        assigns(:season).should eq(season)
      end

      it 'redirects to the season' do
        season = FactoryGirl.create(:season)
        put :update, { id: season.to_param, season: valid_attributes }, valid_session
        response.should redirect_to(season)
      end
    end

    context 'with invalid params' do
      it 'assigns the season as @season' do
        season = FactoryGirl.create(:season)
        # Trigger the behavior that occurs when invalid params are submitted
        Season.any_instance.stub(:save).and_return(false)
        put :update, { id: season.to_param, season: { 'name' => 'invalid value' } }, valid_session
        assigns(:season).should eq(season)
      end

      it "re-renders the 'edit' template" do
        season = FactoryGirl.create(:season)
        # Trigger the behavior that occurs when invalid params are submitted
        Season.any_instance.stub(:save).and_return(false)
        put :update, { id: season.to_param, season: { 'name' => 'invalid value' } }, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested season' do
      season = FactoryGirl.create(:season)
      expect do
        delete :destroy, { id: season.to_param }, valid_session
      end.to change(Season, :count).by(-1)
    end

    it 'redirects to the seasons list' do
      season = FactoryGirl.create(:season)
      delete :destroy, { id: season.to_param }, valid_session
      response.should redirect_to(seasons_url)
    end
  end

end
