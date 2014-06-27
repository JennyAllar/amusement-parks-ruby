require 'spec_helper'
require 'amusement'

describe 'Amusement' do
  it 'should return the theme park name when the ID is given' do
    data = [
      {
        :id => 546,
        :name => "Kalahari Resorts",
        :city => "Wisconsin Dells",
        :state => "Wisconsin",
        :country => "United States"
      },
      {
        :id => 547,
        :name => "Little Amerricka",
        :city => "Marshall",
        :state => "Wisconsin",
        :country => "United States"
      }
    ]

    actual = Amusement.new(data).name(546)
    expected = "Kalahari Resorts"

    expect(actual).to eq expected
  end

  it 'should make the ID the key for all parks' do
    data = [
      {
        :id => 546,
        :name => "Kalahari Resorts",
        :city => "Wisconsin Dells",
        :state => "Wisconsin",
        :country => "United States"
      },
      {
        :id => 547,
        :name => "Little Amerricka",
        :city => "Marshall",
        :state => "Wisconsin",
        :country => "United States"
      }
    ]

    expected = {
      546 => {
        :id => 546,
        :name => "Kalahari Resorts",
        :city => "Wisconsin Dells",
        :state => "Wisconsin",
        :country => "United States"
      },
      547 => {
        :id => 547,
        :name => "Little Amerricka",
        :city => "Marshall",
        :state => "Wisconsin",
        :country => "United States"
      }
    }
    actual = Amusement.new(data).parse
    expect(actual).to eq expected
  end
  
  it 'should index by country' do
    data = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>2,
        :name=>"Calaway Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      }
    ]
    
    expected = {
      "Canada" => [
        {
          :id=>2,
          :name=>"Calaway Park",
          :city=>"Calgary",
          :state=>"Alberta",
          :country=>"Canada"
        }
      ],
      "United States" => [
        {
          :id=>546,
          :name=>"Kalahari Resorts",
          :city=>"Wisconsin Dells",
          :state=>"Wisconsin",
          :country=>"United States"
        },
        {
          :id=>547,
          :name=>"Little Amerricka",
          :city=>"Marshall",
          :state=>"Wisconsin",
          :country=>"United States"
        }
      ]
    }
    actual = Amusement.new(data).by_country
    expect(actual).to eq expected
    end
  
  it 'should index by country and state' do
    data = [
      {
        :id=>3,
        :name=>"Galaxyland",
        :city=>"Edmonton",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>4,
        :name=>"Heratage Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>6,
        :name=>"Playland (Vancouver)",
        :city=>"Vancouver",
        :state=>"British Columbia",
        :country=>"Canada"
      },
      {
        :id=>8,
        :name=>"Crystal Palace Amusement Park",
        :city=>"Dieppe",
        :state=>"New Brunswick",
        :country=>"Canada"
      }
    ]
    
    expected = {
      "Alberta, Canada" => [
        {
          :id => 3,
          :name => "Galaxyland",
          :city => "Edmonton",
          :state => "Alberta",
          :country => "Canada"
        },
        {
          :id => 4,
          :name => "Heratage Park",
          :city => "Calgary",
          :state => "Alberta",
          :country => "Canada"
        },
      ],
      "British Columbia, Canada" => [
        {
          :id => 6,
          :name => "Playland (Vancouver)",
          :city => "Vancouver",
          :state => "British Columbia",
          :country => "Canada"
        },
      ],
      "New Brunswick, Canada" => [
        {
          :id => 8,
          :name => "Crystal Palace Amusement Park",
          :city => "Dieppe",
          :state => "New Brunswick",
          :country => "Canada"
        }
      ]
    }

    actual = Amusement.new(data).country_state
    expect(actual).to eq expected
  end
end