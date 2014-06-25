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

    actual = Amusement.new(data).parse
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

    expect(actual).to eq expected
  end
end