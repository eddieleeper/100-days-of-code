class TimerService
  def initialize(observer, timeout, auto_start = true)
    @observer = observer
    @timeout  = timeout
    start if auto_start
    NSLog("@timeout = #{@timeout}")
    NSLog("@observer = #{@observer}")
    NSLog("auto start = #{auto_start}")
  end

  def start
    @start ||= NSTimer.scheduledTimerWithTimeInterval(@timeout,
                                                      target: @observer,
                                                      selector: 'notify',
                                                      userInfo: nil,

                                                      repeats: true)
    NSLog("Start #{@start}")
  end

  def stop
    @start.invalidate && (@start = nil) unless @start.nil?
  end
end