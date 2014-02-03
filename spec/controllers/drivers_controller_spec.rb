require 'spec_helper'

describe DriversController do

  let(:valid_attributes) { { 'first_name' => 'First Name', 'last_name' => 'Last name' } }
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all drivers as @drivers' do
      driver = FactoryGirl.create(:driver)
      get :index, {}, valid_session
      assigns(:drivers).should eq([driver])
    end
  end

  describe 'GET show' do
    it 'assigns the requested driver as @driver' do
      driver = FactoryGirl.create(:driver)
      get :show, { id: driver.to_param }, valid_session
      assigns(:driver).should eq(driver)
    end
  end

  describe 'GET new' do
    it 'assigns a new driver as @driver' do
      get :new, {}, valid_session
      assigns(:driver).should be_a_new(Driver)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested driver as @driver' do
      driver = FactoryGirl.create(:driver)
      get :edit, { id: driver.to_param }, valid_session
      assigns(:driver).should eq(driver)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Driver' do
        expect do
          post :create, { driver: valid_attributes }, valid_session
        end.to change(Driver, :count).by(1)
      end

      it 'assigns a newly created driver as @driver' do
        post :create, { driver: valid_attributes }, valid_session
        assigns(:driver).should be_a(Driver)
        assigns(:driver).should be_persisted
      end

      it 'redirects to the created driver' do
        post :create, { driver: valid_attributes }, valid_session
        response.should redirect_to(Driver.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved driver as @driver' do
        # Trigger the behavior that occurs when invalid params are submitted
        Driver.any_instance.stub(:save).and_return(false)
        post :create, { driver: { 'first_name' => 'invalid value' } }, valid_session
        assigns(:driver).should be_a_new(Driver)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Driver.any_instance.stub(:save).and_return(false)
        post :create, { driver: { 'first_name' => 'invalid value' } }, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      it 'updates the requested driver' do
        driver = FactoryGirl.create(:driver)
        Driver.any_instance.should_receive(:update).with('first_name' => 'MyString')
        put :update, { id: driver.to_param, driver: { 'first_name' => 'MyString' } }, valid_session
      end

      it 'assigns the requested driver as @driver' do
        driver = FactoryGirl.create(:driver)
        put :update, { id: driver.to_param, driver: valid_attributes }, valid_session
        assigns(:driver).should eq(driver)
      end

      it 'redirects to the driver' do
        driver = FactoryGirl.create(:driver)
        put :update, { id: driver.to_param, driver: valid_attributes }, valid_session
        response.should redirect_to(driver)
      end
    end

    context 'with invalid params' do
      it 'assigns the driver as @driver' do
        driver = FactoryGirl.create(:driver)
        # Trigger the behavior that occurs when invalid params are submitted
        Driver.any_instance.stub(:save).and_return(false)
        put :update, { id: driver.to_param, driver: { 'first_name' => 'invalid value' } }, valid_session
        assigns(:driver).should eq(driver)
      end

      it "re-renders the 'edit' template" do
        driver = FactoryGirl.create(:driver)
        # Trigger the behavior that occurs when invalid params are submitted
        Driver.any_instance.stub(:save).and_return(false)
        put :update, { id: driver.to_param, driver: { 'first_name' => 'invalid value' } }, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested driver' do
      driver = FactoryGirl.create(:driver)
      expect do
        delete :destroy, { id: driver.to_param }, valid_session
      end.to change(Driver, :count).by(-1)
    end

    it 'redirects to the drivers list' do
      driver = FactoryGirl.create(:driver)
      delete :destroy, { id: driver.to_param }, valid_session
      response.should redirect_to(drivers_url)
    end
  end

end
