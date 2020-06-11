describe TimerService do
  before do
    @test_obs = TestObs.new
    @timer = TimerService.new(@test_obs, 1, false)
  end

  it 'fires the timer' do
    @timer.start
    sleep(1.6)
    @test_obs.count.should == 1
  end
end

class TestObs
  attr_reader :count

  def initialize
    @count = 0
  end

  def notify
    NSLog("Notify: @count = #{@count}")
    @count += 1
  end
end
