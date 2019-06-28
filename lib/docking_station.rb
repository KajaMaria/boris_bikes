require 'bike'



class DockingStation
    DEFAULT_CAPACITY = 20

    attr_accessor :capacity
    attr_reader :bikes_array

    def initialize(capacity= DEFAULT_CAPACITY)
       @bikes_array = []
       @capacity = capacity
    end

    def release_bike
        fail 'No bikes available' if empty?
        fail 'No bikes available' if any_working
        @bikes_array.pop
    end

    def dock_bike(bike)
        raise 'Docking station full' if full?
        @bikes_array << bike
    end

    private

    def any_working
      working_bikes = []
      broken_bikes = []
      @bikes_array.each do |bike|
        if bike.broken? == true
          broken_bikes << bike
        else
          working_bikes << bike
        end
      end
    end

      def broken?
        @bikes_array.broken?
      end

      def full?
       @bikes_array.count >= capacity
      end

      def empty?
        @bikes_array.empty?
      end

end
