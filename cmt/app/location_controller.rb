class LocationController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('List', image: UIImage.imageNamed('list.png'), tag: 1)
    end
    self
  end

  def viewDidLoad
    @location_store = Cmt::LocationStore.store
    @timer_service ||= TimerService.new(5)
    @timer_service.add_observer(self)
    value_label('Waiting for Location')
    button_for('Update', 260)
  end

  def update
    location = Cmt::Location.new(location_service.latitude, location_service.longitude, Time.now)
    @location_store << location
    @value.text = location.to_s
  end

  private

  def location_service
    @location_service ||= LocationService.new
  end

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
    button      = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.font = UIFont.systemFontOfSize(30)
    button.setTitle(caption, forState: UIControlStateNormal)
    button.addTarget(self, action: 'update', forControlEvents: UIControlEventTouchUpInside)
    button.frame = [[margin, position], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(button)
  end
end