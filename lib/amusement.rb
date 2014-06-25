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
   count = @data.map {|resort| {resort[:id] => resort}}.length
   @data.map {|resort| {resort[:id] => resort}}.take(count)
  
   end
  end
