module Cmt
  class LocationStore
    def self.store
      @store ||= new
    end

    def initialize
      @locations = []
    end

    def locations
      @locations
    end

    def <<(location)
      @locations << location
    end
  end
end