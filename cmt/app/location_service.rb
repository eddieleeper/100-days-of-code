class LocationService
  attr_reader :longitude, :latitude

  def initialize
    @location_manager = CLLocationManager.alloc.init.tap do |lm|
      lm.requestAlwaysAuthorization

      lm.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
      lm.startUpdatingLocation
      lm.delegate = self
    end
  end

  def location
    "#{@longitude}:#{@latitude}"
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    @latitude =  newLocation.coordinate.latitude
    @longitude = newLocation.coordinate.longitude
  end

  def locationManager(manager, didFailWithError:error)
    puts error
  end

end