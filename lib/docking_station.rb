class DockingStation

    attr_reader :bikes_array

    def initialize
       @bikes_array = []
    end

    def release_bike
        fail 'No bikes available' if @bikes_array.empty?
        @bikes_array.pop
    end

    def dock_bike(bike)
        raise 'Docking station full' if @bikes_array.count >= 20 
        @bikes_array << bike
    end
end

