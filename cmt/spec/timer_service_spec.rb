describe TimerService do
  before do
    @test_obs = TestObs.new
    @timer = TimerService.new(1)
    @timer.add_observer(@test_obs)
  end

  it 'fires the timer' do
    wait 1.0 do
      @test_obs.count.should == 1
    end
  end
end

class TestObs
  attr_reader :count

  def initialize
    @count = 0
  end

  def update
    NSLog("Update: @count = #{@count}")
    @count += 1
  end
end
