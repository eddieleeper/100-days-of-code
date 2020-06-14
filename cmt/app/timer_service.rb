class TimerService
  include Cmt::Observable

  def initialize(timeout, auto_start = true)
    @timeout = timeout
    start if auto_start
    NSLog("@timeout = #{@timeout}")
    NSLog("auto start = #{auto_start}")
  end

  def start
    @start ||= NSTimer.scheduledTimerWithTimeInterval(@timeout,
                                                      target: self,
                                                      selector: 'notify',
                                                      userInfo: nil,

                                                      repeats: true)
    NSLog("Start #{@start}")
  end

  def stop
    @start.invalidate && (@start = nil) unless @start.nil?
  end
end