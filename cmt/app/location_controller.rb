class LocationController < UIViewController
  def viewDidLoad
    value_label('Unknown Location')
    button_for('Update', 260)
    @location_service = LocationService.new(self)
    @timer_service = TimerService.new(self, 60)

  end

  def notify
    @value.text = @location_service.location.to_s
  end

  private

  def value_label(initial_text, margin = 20)
    @value                 = UILabel.new
    @value.font            = UIFont.systemFontOfSize(20)
    @value.text            = initial_text
    @value.textAlignment   = UITextAlignmentCenter
    @value.textColor       = UIColor.whiteColor
    @value.backgroundColor = UIColor.clearColor
    @value.frame           = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@value)
  end

  def button_for(caption, position, margin = 20)
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.font = UIFont.systemFontOfSize(30)
    button.setTitle(caption, forState: UIControlStateNormal)
    button.addTarget(self, action: 'notify', forControlEvents: UIControlEventTouchUpInside)
    button.frame = [[margin, position], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(button)
  end

end