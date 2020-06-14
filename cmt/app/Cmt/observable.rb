module Cmt
  module Observable
    def add_observer(observer)
      observers << observer
    end

    def delete_observer(observer)
      observers.delete(observer)
    end

    def notify
      observers.each(&:update)
    end

    private

    def observers
      @observers ||= []
    end
  end
end