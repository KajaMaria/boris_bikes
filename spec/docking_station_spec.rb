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

        it 'raises error if only broken bikes available' do
          bike = Bike.new
          bike.report_broken
          subject.dock_bike(bike)
          expect { subject.release_bike}.to raise_error 'No bikes available'

        end
    end

    it 'docks bike' do
        expect(subject).to respond_to(:dock_bike).with(1).argument
    end

    it 'checks if the there is a bike' do
        expect(subject).to respond_to :bikes_array
    end

    it 'returns docked bike' do
        bike = Bike.new
        subject.dock_bike(bike)
        expect(subject.bikes_array).to include bike
    end

    describe '#dock_bike' do
      it 'rarises an error when it is full' do
        subject.capacity.times {subject.dock_bike Bike.new}
        expect { subject.dock_bike(Bike.new) }.to raise_error 'Docking station full'
      end
    end

    describe '#initialize' do
      subject {DockingStation.new}
      let(:bike) { Bike.new }
         it 'our default capacity' do
            DockingStation::DEFAULT_CAPACITY.times do
            subject.dock_bike(bike)
         end
            expect { subject.dock_bike(bike) }.to raise_error 'Docking station full'
      end

    it 'has a set variable' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock_bike(bike) }
      expect{ docking_station.dock_bike(bike)}.to raise_error 'Docking station full'
    end
  end
end
