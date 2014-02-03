require 'spec_helper'

describe Race do
  let(:season) { FactoryGirl.create(:season) }
  let(:race) { FactoryGirl.build(:race) }

  describe '#venue' do
    context 'with valid params' do
      it 'should be valid' do
        race.venue = 'venue'
        expect(race).to be_valid
      end

      it 'should be valid with long venue' do
        race.venue = 'a' * 255
        expect(race).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing venue' do
        race.venue = nil
        expect(race).to be_invalid
      end

      it 'should be invalid with blank venue' do
        race.venue = ''
        expect(race).to be_invalid
      end

      it 'should be invalid with long venue' do
        race.venue = 'a' * 256
        expect(race).to be_invalid
      end
    end
  end

  describe '#date' do
    context 'with valid params' do
      it 'should be valid' do
        race.date = '2012-08-04'
        expect(race).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing date' do
        race.date = nil
        expect(race).to be_invalid
      end

      it 'should be invalid with blank date' do
        race.date = ''
        expect(race).to be_invalid
      end

      it 'should be invalid with badly formed date' do
        race.date = 'a' * 6
        expect(race).to be_invalid
      end
    end
  end

  describe '#season' do
    context 'with valid params' do
      it 'should be valid' do
        race.season = season
        expect(race).to be_valid
      end
    end

    context 'with invalid params' do
      it 'should be invalid with missing season' do
        race.season = nil
        expect(race).to be_invalid
      end

      it 'should be invalid with blank season_id' do
        race.season_id = ''
        expect(race).to be_invalid
      end
    end
  end
end
