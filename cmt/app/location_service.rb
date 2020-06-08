class LocationService
  def initialize(observer)
    @observer = observer
    @location_manager = CLLocationManager.alloc.init.tap do |lm|
      lm.requestAlwaysAuthorization

      lm.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
      lm.startUpdatingLocation
      lm.delegate = self
    end
  end

  def location
    "#{@long}:#{@lat}"
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    @lat =  "#{newLocation.coordinate.latitude}"
    @long = "#{newLocation.coordinate.longitude}"
    @observer.notify
  end

  def locationManager(manager, didFailWithError:error)
    puts error
  end

end