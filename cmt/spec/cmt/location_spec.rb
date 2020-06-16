describe Cmt::Location do
  it 'stores the latitude, longitude and time of creation' do
    location = Cmt::Location.new(0, 0, Time.at(1592314435))
    location.latitude.should.equal(0)
    location.longitude.should.equal(0)
    location.timestamp.year.should.equal(2020)
    location.timestamp.month.should.equal(6)
    location.timestamp.day.should.equal(16)
    location.timestamp.hour.should.equal(14)
    location.timestamp.min.should.equal(33)
    location.to_s.should.equal('0, 0 [2020-06-16 14:33:55 +0100]')
  end
end