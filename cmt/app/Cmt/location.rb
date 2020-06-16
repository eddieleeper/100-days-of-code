module Cmt
  Location = Struct.new(:latitude, :longitude, :timestamp) do
    def to_s
      "#{latitude}, #{longitude} [#{timestamp}]"
    end
  end
end