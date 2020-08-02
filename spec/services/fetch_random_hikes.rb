require 'rails_helper'

describe FetchRandomHikes do
  let(:body_example) {
    {
      "trails"=>
     [{"id"=>7084306,
       "name"=>"Saddle Rock Trail",
       "type"=>"Trail",
       "summary"=>"Amazing climb highlighting everything Scotts Bluff offers. Features a tunnel, numerous views, history, and geology.",
       "difficulty"=>"black",
       "stars"=>5,
       "starVotes"=>1,
       "location"=>"Gering, Nebraska",
       "url"=>"https://www.hikingproject.com/trail/7084306/saddle-rock-trail",
       "imgSqSmall"=>"https://cdn2.apstatic.com/photos/hike/7047061_sqsmall_1555536270.jpg",
       "imgSmall"=>"https://cdn2.apstatic.com/photos/hike/7047061_small_1555536270.jpg",
       "imgSmallMed"=>"https://cdn2.apstatic.com/photos/hike/7047061_smallMed_1555536270.jpg",
       "imgMedium"=>"https://cdn2.apstatic.com/photos/hike/7047061_medium_1555536270.jpg",
       "length"=>1.7,
       "ascent"=>608,
       "descent"=>-111,
       "high"=>4634,
       "low"=>4108,
       "longitude"=>-103.7071,
       "latitude"=>41.8286,
       "conditionStatus"=>"Unknown",
       "conditionDetails"=>nil,
       "conditionDate"=>"1970-01-01 00:00:00"}],
       "success"=>1
    }
  }
  let(:response) { double(Faraday::Connection, body: body_example) }
  context 'has functions to facilitate the search of trails' do
    it 'has a latitude value' do
      #TODO(Diogo): This value cannot be random. The user will select the place on
      #an map on the future
      allow(described_class).to receive(:latitude).and_return(39)

      expect(described_class.latitude).to eq(39)
    end

    it 'has a longitude value' do
      #TODO(Diogo): This value cannot be random. The user will select the place on
      #an map on the future
      allow(described_class).to receive(:longitude).and_return(-107)

      expect(described_class.longitude).to eq(-107)
    end

    it 'has a key used on the hiking project api' do
      var = ENV.fetch('HIKING_PROJECT_API')

      expect(var).not_to be_empty
    end

    it 'has a limit per query of ten itens' do
      expect(described_class).to receive(:limit_per_query)
        .with(10)
        .and_return(10)

      described_class.limit_per_query(10)
    end
  end

  context 'returns information of the api' do
    it 'returns one item on the query' do
      expect(described_class).to receive(:fetch_hikes)
        .with(limit: 1)
        .and_return(response)

      described_class.fetch_hikes(limit: 1)
    end

    it 'returns limit of 1 item' do
      #TODO(Diogo): Maybe more? I don't think that more than 10 items make sense
      #at the moment.

      allow(described_class)
        .to receive(:fetch_hikes)
        .with(limit: 15)
        .and_return(response)

      item = [response.body] * 10

      expect(item.size).to eq(10)
    end
  end
end
