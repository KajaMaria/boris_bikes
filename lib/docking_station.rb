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
        @bikes_array.pop
    end

    def dock_bike(bike)
        raise 'Docking station full' if full?
        @bikes_array << bike
    end

    private

      def full?
       @bikes_array.count >= capacity
      end

      def empty?
        @bikes_array.empty?
      end

end
