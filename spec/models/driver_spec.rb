require 'spec_helper'

describe Driver do
  let(:driver) { FactoryGirl.build(:driver) }

  describe '#first_name' do
    context 'with valid params' do
      it 'should be valid' do
        driver.first_name = 'name'
        expect(driver).to be_valid
      end

      it 'should be valid with long name' do
        driver.first_name = 'a' * 255
        expect(driver).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing name' do
        driver.first_name = nil
        expect(driver).to be_invalid
      end

      it 'should be invalid with blank name' do
        driver.first_name = ''
        expect(driver).to be_invalid
      end

      it 'should be invalid with long name' do
        driver.first_name = 'a' * 256
        expect(driver).to be_invalid
      end
    end

  end

  describe '#last_name' do
    context 'with valid params' do
      it 'should be valid' do
        driver.last_name = 'name'
        expect(driver).to be_valid
      end

      it 'should be valid with long name' do
        driver.last_name = 'a' * 255
        expect(driver).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing name' do
        driver.last_name = nil
        expect(driver).to be_invalid
      end

      it 'should be invalid with blank name' do
        driver.last_name = ''
        expect(driver).to be_invalid
      end

      it 'should be invalid with long name' do
        driver.last_name = 'a' * 256
        expect(driver).to be_invalid
      end
    end

  end
end
