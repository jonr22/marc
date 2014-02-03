require 'spec_helper'

describe DriverDivision do
  let(:division) { FactoryGirl.build(:driver_division) }

  describe '#name' do
    context 'with valid params' do
      it 'should be valid' do
        division.name = 'name'
        expect(division).to be_valid
      end

      it 'should be valid with long name' do
        division.name = 'a' * 255
        expect(division).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing name' do
        division.name = nil
        expect(division).to be_invalid
      end

      it 'should be invalid with blank name' do
        division.name = ''
        expect(division).to be_invalid
      end

      it 'should be invalid with long name' do
        division.name = 'a' * 256
        expect(division).to be_invalid
      end
    end

  end
end
