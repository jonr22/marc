require 'spec_helper'

describe RacesController do

  let(:season) { FactoryGirl.create(:season) }
  let(:valid_attributes) { { 'date' => '2014-02-02', 'venue' => 'South Shore Speedway', 'season_id' => season.id } }
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all races as @races' do
      race = FactoryGirl.create(:race)
      get :index, {}, valid_session
      assigns(:races).should eq([race])
    end
  end

  describe 'GET show' do
    it 'assigns the requested race as @race' do
      race = FactoryGirl.create(:race)
      get :show, { id: race.to_param }, valid_session
      assigns(:race).should eq(race)
    end
  end

  describe 'GET new' do
    it 'assigns a new race as @race' do
      get :new, {}, valid_session
      assigns(:race).should be_a_new(Race)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested race as @race' do
      race = FactoryGirl.create(:race)
      get :edit, { id: race.to_param }, valid_session
      assigns(:race).should eq(race)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Race' do
        expect do
          post :create, { race: valid_attributes }, valid_session
        end.to change(Race, :count).by(1)
      end

      it 'assigns a newly created race as @race' do
        post :create, { race: valid_attributes }, valid_session
        assigns(:race).should be_a(Race)
        assigns(:race).should be_persisted
      end

      it 'redirects to the created race' do
        post :create, { race: valid_attributes }, valid_session
        response.should redirect_to(Race.last)
      end
    end

    context 'with invalid param' do
      it 'assigns a newly created but unsaved race as @race' do
        # Trigger the behavior that occurs when invalid params are submitted
        Race.any_instance.stub(:save).and_return(false)
        post :create, { race: { 'date' => 'invalid value' } }, valid_session
        assigns(:race).should be_a_new(Race)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Race.any_instance.stub(:save).and_return(false)
        post :create, { race: { 'date' => 'invalid value' } }, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      it 'updates the requested race' do
        race = FactoryGirl.create(:race)
        Race.any_instance.should_receive(:update).with('date' => '2014-02-02')
        put :update, { id: race.to_param, race: { 'date' => '2014-02-02' } }, valid_session
      end

      it 'assigns the requested race as @race' do
        race = FactoryGirl.create(:race)
        put :update, { id: race.to_param, race: valid_attributes }, valid_session
        assigns(:race).should eq(race)
      end

      it 'redirects to the race' do
        race = FactoryGirl.create(:race)
        put :update, { id: race.to_param, race: valid_attributes }, valid_session
        response.should redirect_to(race)
      end
    end

    context 'with invalid params' do
      it 'assigns the race as @race' do
        race = FactoryGirl.create(:race)
        # Trigger the behavior that occurs when invalid params are submitted
        Race.any_instance.stub(:save).and_return(false)
        put :update, { id: race.to_param, race: { 'date' => 'invalid value' } }, valid_session
        assigns(:race).should eq(race)
      end

      it "re-renders the 'edit' template" do
        race = FactoryGirl.create(:race)
        # Trigger the behavior that occurs when invalid params are submitted
        Race.any_instance.stub(:save).and_return(false)
        put :update, { id: race.to_param, race: { 'date' => 'invalid value' } }, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested race' do
      race = FactoryGirl.create(:race)
      expect do
        delete :destroy, { id: race.to_param }, valid_session
      end.to change(Race, :count).by(-1)
    end

    it 'redirects to the races list' do
      race = FactoryGirl.create(:race)
      delete :destroy, { id: race.to_param }, valid_session
      response.should redirect_to(races_url)
    end
  end

end
