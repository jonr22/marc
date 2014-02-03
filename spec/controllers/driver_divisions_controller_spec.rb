require 'spec_helper'

describe DriverDivisionsController do

  let(:valid_attributes) { { 'name' => 'MyString' } }
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all driver_divisions as @driver_divisions' do
      driver_division = FactoryGirl.create(:driver_division)
      get :index, {}, valid_session
      assigns(:driver_divisions).should eq([driver_division])
    end
  end

  describe 'GET show' do
    it 'assigns the requested driver_division as @driver_division' do
      driver_division = FactoryGirl.create(:driver_division)
      get :show, { id: driver_division.to_param }, valid_session
      assigns(:driver_division).should eq(driver_division)
    end
  end

  describe 'GET new' do
    it 'assigns a new driver_division as @driver_division' do
      get :new, {}, valid_session
      assigns(:driver_division).should be_a_new(DriverDivision)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested driver_division as @driver_division' do
      driver_division = FactoryGirl.create(:driver_division)
      get :edit, { id: driver_division.to_param }, valid_session
      assigns(:driver_division).should eq(driver_division)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new DriverDivision' do
        expect do
          post :create, { driver_division: valid_attributes }, valid_session
        end.to change(DriverDivision, :count).by(1)
      end

      it 'assigns a newly created driver_division as @driver_division' do
        post :create, { driver_division: valid_attributes }, valid_session
        assigns(:driver_division).should be_a(DriverDivision)
        assigns(:driver_division).should be_persisted
      end

      it 'redirects to the created driver_division' do
        post :create, { driver_division: valid_attributes }, valid_session
        response.should redirect_to(DriverDivision.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved driver_division as @driver_division' do
        # Trigger the behavior that occurs when invalid params are submitted
        DriverDivision.any_instance.stub(:save).and_return(false)
        post :create, { driver_division: { 'name' => 'invalid value' } }, valid_session
        assigns(:driver_division).should be_a_new(DriverDivision)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DriverDivision.any_instance.stub(:save).and_return(false)
        post :create, { driver_division: { 'name' => 'invalid value' } }, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      it 'updates the requested driver_division' do
        driver_division = FactoryGirl.create(:driver_division)
        DriverDivision.any_instance.should_receive(:update).with('name' => 'MyString')
        put :update, { id: driver_division.to_param, driver_division: { 'name' => 'MyString' } }, valid_session
      end

      it 'assigns the requested driver_division as @driver_division' do
        driver_division = FactoryGirl.create(:driver_division)
        put :update, { id: driver_division.to_param, driver_division: valid_attributes }, valid_session
        assigns(:driver_division).should eq(driver_division)
      end

      it 'redirects to the driver_division' do
        driver_division = FactoryGirl.create(:driver_division)
        put :update, { id: driver_division.to_param, driver_division: valid_attributes }, valid_session
        response.should redirect_to(driver_division)
      end
    end

    context 'with invalid params' do
      it 'assigns the driver_division as @driver_division' do
        driver_division = FactoryGirl.create(:driver_division)
        # Trigger the behavior that occurs when invalid params are submitted
        DriverDivision.any_instance.stub(:save).and_return(false)
        put :update, { id: driver_division.to_param, driver_division: { 'name' => 'invalid value' } }, valid_session
        assigns(:driver_division).should eq(driver_division)
      end

      it "re-renders the 'edit' template" do
        driver_division = FactoryGirl.create(:driver_division)
        # Trigger the behavior that occurs when invalid params are submitted
        DriverDivision.any_instance.stub(:save).and_return(false)
        put :update, { id: driver_division.to_param, driver_division: { 'name' => 'invalid value' } }, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested driver_division' do
      driver_division = FactoryGirl.create(:driver_division)
      expect do
        delete :destroy, { id: driver_division.to_param }, valid_session
      end.to change(DriverDivision, :count).by(-1)
    end

    it 'redirects to the driver_divisions list' do
      driver_division = FactoryGirl.create(:driver_division)
      delete :destroy, { id: driver_division.to_param }, valid_session
      response.should redirect_to(driver_divisions_url)
    end
  end

end
