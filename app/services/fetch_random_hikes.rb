class FetchRandomHikes
  def self.fetch_hikes
    conn
  end

  private

  def self.conn
    response = Faraday.get(url) do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['key'] = key
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

  def self.url
    "#{ENV.fetch('HIKING_PROJECT_URL')}/get-trails"
  end

  def self.key
    ENV.fetch("HIKING_PROJECT_API")
  end

  def self.latitude
    Random.new.rand(39..42)
  end

  def self.longitude
    Random.new.rand(-107..-104)
  end
end