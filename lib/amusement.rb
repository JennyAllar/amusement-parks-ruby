class Amusement

  def initialize(data)
    @data = data
  end

  def name(resort_id)
    name_array = []
    @data.each do |resort|
      if resort_id == resort[:id]
        name_array << resort[:name]
      end
    end
    name_array[0]
  end

  def parse
    output ={}
    @data.map { |resort|
      output[resort[:id]] = resort

    }
    output
  end

  def country(country)
    output ={}
    resort_array = []
    @data.each do |resort|
      if resort[:country] == country
        resort_array << resort
        output[country] = resort_array
      end
    end
    output
  end

  def by_country
    hash = {}
    @data.each do |info|
      country = info[:country]
      hash[country] ||= []
      hash[country] << info
    end
    hash
  end


  def country_state
    output = {}
    @data.each do |resort|
      country = resort[:country]
      state = resort[:state]
      output[state + ', ' + country] ||= []
      output[state + ', ' + country] << resort
    end
    output
  end
end
