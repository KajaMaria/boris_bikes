require 'bike'

describe Bike do
    it 'report broken bike' do
      subject.report_broken
      expect(subject).to be_broken
    end
    it 'checks whether the bike is working' do
        expect(subject.working?).to eq true
    end
end
