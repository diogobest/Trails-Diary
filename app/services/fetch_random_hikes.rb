# frozen_string_literal: true

class FetchRandomHikes
  def self.fetch_hikes(limit: limit)
    conn(limit)
  end

  def self.conn(limit)
    response = Faraday.get(url) do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['maxResults'] = limit_per_query(limit)
      req.params['key'] = key
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

  def self.url
    #TODO(Diogo): The content of this api is very limited...Maybe I'll remove it
    #in the future.
    "#{ENV.fetch('HIKING_PROJECT_URL')}/get-trails"
  end

  def self.key
    ENV.fetch('HIKING_PROJECT_API')
  end

  def self.latitude
    Random.new.rand(39..42)
  end

  def self.longitude
    Random.new.rand(-107..-104)
  end

  def self.limit_per_query(limit)
    return limit if limit <= 10
    10
  end
end
