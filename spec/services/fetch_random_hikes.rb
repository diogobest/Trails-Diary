require 'rails_helper'

describe FetchRandomHikes do
  let(:body) {

  }

  let(:double) { double(Faraday::Connection, body: body) }
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
end
