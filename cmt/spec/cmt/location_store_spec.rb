describe Cmt::LocationStore do

  it 'is a singleton' do
    ls1 = Cmt::LocationStore.store
    ls2 = Cmt::LocationStore.store
    ls1.should.equal(ls2)
  end

  it 'is initialized with no locations' do
    store = Cmt::LocationStore.store
    store.locations.should.equal([])
  end

  it 'stores locations' do
    store = Cmt::LocationStore.store
    location = Cmt::Location.new(10, 10, Time.at(1592314435))
    store << location
    store.locations[0].should.equal(location)
  end
end
