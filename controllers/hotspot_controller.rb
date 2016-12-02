require_relative '../views/hotspot_view'

class HotspotController
  include HotspotView

  def initialize(hotspot)
    @hotspot = hotspot
  end

  def run
    input = ""
    until input == 'quit'
      HotspotView.show_menu_options
      input = gets.chomp
      case input
        when "1" then get_boro_input
        when "2" then get_provider_input
        when "3" then find_free
        when "4" then find_by_address
      end
    end
  end

  def get_boro_input
    boros = ["QU", "QN", "SI", "MN", "BK", "BX"]
    puts "Enter a borough:"
    input = gets.chomp.upcase
    boros.each do |boro|
      if boro.chars.all? {|char| input.include?(char) }
        results = @hotspot.search_boro(boro)
        HotspotView.display_results(results)
      end
    end
  end

  def get_provider_input
    puts "Enter provider:"
    input = gets.chomp
    results = @hotspot.search_provider(titlecase(input))
    HotspotView.display_results(results)
  end

  def find_free
    results = @hotspot.search_free
    HotspotView.display_results(results)
  end

  def find_by_address
    puts "Enter address:"
    address = gets.chomp
    puts "Enter radius (miles):"
    radius = gets.chomp.to_f
    results = @hotspot.search_nearby(address, radius)
    HotspotView.display_results(results)
  end

  def titlecase(string)
    string.split.map {|word| word.capitalize }.join(' ')
  end

end
