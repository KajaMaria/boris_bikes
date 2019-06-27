require 'docking_station'
require 'bike'

describe DockingStation do 
    it 'responds to release_bike' do
        expect(subject).to respond_to :release_bike
    end

    describe '#release_bike' do
        it 'raises an error if no bikes' do
            expect { subject.release_bike }.to raise_error 'No bikes available'
        end
    end

    it 'docks bike' do
        expect(subject).to respond_to(:dock_bike).with(1).argument
    end

    it 'checks if the there is a bike' do
        expect(subject).to respond_to :bike 
    end

    it 'docks something' do
        bike = Bike.new
        expect(subject.dock_bike(bike)).to eq bike
    end

    it 'returns docked bike' do
        bike = Bike.new
        subject.dock_bike(bike)
        expect(subject.bike).to eq bike
    end

end
