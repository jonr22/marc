require 'spec_helper'

describe RaceClass do
  let(:race_class) { FactoryGirl.build(:race_class) }

  describe '#name' do
    context 'with valid params' do
      it 'should be valid' do
        race_class.name = 'name'
        expect(race_class).to be_valid
      end

      it 'should be valid with long name' do
        race_class.name = 'a' * 255
        expect(race_class).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing name' do
        race_class.name = nil
        expect(race_class).to be_invalid
      end

      it 'should be invalid with blank name' do
        race_class.name = ''
        expect(race_class).to be_invalid
      end

      it 'should be invalid with long name' do
        race_class.name = 'a' * 256
        expect(race_class).to be_invalid
      end
    end

  end
end
