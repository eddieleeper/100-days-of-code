class MapController < UIViewController
  def viewDidLoad
    @map_view          = MKMapView.alloc.initWithFrame(view.bounds)
    @map_view.delegate = self
    @map_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    view.addSubview(@map_view)
    @location_service = LocationService.new(self)
  end

  def notify
    NSLog("Updating location #{@location_service.location}")
    location = CLLocationCoordinate2DMake(@location_service.latitude, @location_service.longitude)
    annotation = CovidAnnotation.alloc.initWithCoordinates(location, title:"My Location", subTitle:"COVID-19")
    @map_view.addAnnotation(annotation)
    region = MKCoordinateRegionMake(location, MKCoordinateSpanMake(0.1, 0.1))
    @map_view.setRegion(region)
  end

  def viewDidUnload
    @map_view = nil
    @location_service = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end