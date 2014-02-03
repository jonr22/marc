require 'spec_helper'

describe Season do
  let(:season) { FactoryGirl.build(:season) }

  describe '#name' do
    context 'with valid params' do
      it 'should be valid' do
        season.name = 'name'
        expect(season).to be_valid
      end

      it 'should be valid with long name' do
        season.name = 'a' * 255
        expect(season).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing name' do
        season.name = nil
        expect(season).to be_invalid
      end

      it 'should be invalid with blank name' do
        season.name = ''
        expect(season).to be_invalid
      end

      it 'should be invalid with long name' do
        season.name = 'a' * 256
        expect(season).to be_invalid
      end
    end

  end
end
