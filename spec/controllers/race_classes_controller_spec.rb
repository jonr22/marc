require 'spec_helper'

describe RaceClassesController do

  let(:valid_attributes) { { 'name' => 'MyString' } }
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all race_classes as @race_classes' do
      race_class = FactoryGirl.create(:race_class)
      get :index, {}, valid_session
      assigns(:race_classes).should eq([race_class])
    end
  end

  describe 'GET show' do
    it 'assigns the requested race_class as @race_class' do
      race_class = FactoryGirl.create(:race_class)
      get :show, { id: race_class.to_param }, valid_session
      assigns(:race_class).should eq(race_class)
    end
  end

  describe 'GET new' do
    it 'assigns a new race_class as @race_class' do
      get :new, {}, valid_session
      assigns(:race_class).should be_a_new(RaceClass)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested race_class as @race_class' do
      race_class = FactoryGirl.create(:race_class)
      get :edit, { id: race_class.to_param }, valid_session
      assigns(:race_class).should eq(race_class)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new RaceClass' do
        expect do
          post :create, { race_class: valid_attributes }, valid_session
        end.to change(RaceClass, :count).by(1)
      end

      it 'assigns a newly created race_class as @race_class' do
        post :create, { race_class: valid_attributes }, valid_session
        assigns(:race_class).should be_a(RaceClass)
        assigns(:race_class).should be_persisted
      end

      it 'redirects to the created race_class' do
        post :create, { race_class: valid_attributes }, valid_session
        response.should redirect_to(RaceClass.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved race_class as @race_class' do
        # Trigger the behavior that occurs when invalid params are submitted
        RaceClass.any_instance.stub(:save).and_return(false)
        post :create, { race_class: { 'name' => 'invalid value' } }, valid_session
        assigns(:race_class).should be_a_new(RaceClass)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RaceClass.any_instance.stub(:save).and_return(false)
        post :create, { race_class: { 'name' => 'invalid value' } }, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      it 'updates the requested race_class' do
        race_class = FactoryGirl.create(:race_class)
        RaceClass.any_instance.should_receive(:update).with('name' => 'MyString')
        put :update, { id: race_class.to_param, race_class: { 'name' => 'MyString' } }, valid_session
      end

      it 'assigns the requested race_class as @race_class' do
        race_class = FactoryGirl.create(:race_class)
        put :update, { id: race_class.to_param, race_class: valid_attributes }, valid_session
        assigns(:race_class).should eq(race_class)
      end

      it 'redirects to the race_class' do
        race_class = FactoryGirl.create(:race_class)
        put :update, { id: race_class.to_param, race_class: valid_attributes }, valid_session
        response.should redirect_to(race_class)
      end
    end

    context 'with invalid params' do
      it 'assigns the race_class as @race_class' do
        race_class = FactoryGirl.create(:race_class)
        # Trigger the behavior that occurs when invalid params are submitted
        RaceClass.any_instance.stub(:save).and_return(false)
        put :update, { id: race_class.to_param, race_class: { 'name' => 'invalid value' } }, valid_session
        assigns(:race_class).should eq(race_class)
      end

      it "re-renders the 'edit' template" do
        race_class = RaceClass.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RaceClass.any_instance.stub(:save).and_return(false)
        put :update, { id: race_class.to_param, race_class: { 'name' => 'invalid value' } }, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested race_class' do
      race_class = FactoryGirl.create(:race_class)
      expect do
        delete :destroy, { id: race_class.to_param }, valid_session
      end.to change(RaceClass, :count).by(-1)
    end

    it 'redirects to the race_classes list' do
      race_class = FactoryGirl.create(:race_class)
      delete :destroy, { id: race_class.to_param }, valid_session
      response.should redirect_to(race_classes_url)
    end
  end

end
