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
end
