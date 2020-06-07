class LocationController < UIViewController
  def viewDidLoad
    value_label('Unknown Location')
    @value.text = location
  end

  def location
    @location_manager ||= CLLocationManager.alloc.init.tap do |lm|
      # since iOS 8 a request to use the location must be sent
      lm.requestAlwaysAuthorization

      lm.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
      lm.startUpdatingLocation
      lm.delegate = self
    end
    @location_manager.to_s
  end

  private

  def value_label(initial_text, margin = 20)
    @value                 = UILabel.new
    @value.font            = UIFont.systemFontOfSize(30)
    @value.text            = initial_text
    @value.textAlignment   = UITextAlignmentCenter
    @value.textColor       = UIColor.whiteColor
    @value.backgroundColor = UIColor.clearColor
    @value.frame           = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@value)
  end
end