require_relative 'models/hotspot'
require_relative 'controllers/hotspot_controller'
require_relative 'views/hotspot_view'

require 'pry'


search_boro =  Hotspot.new
controller = HotspotController.new(search_boro)

controller.run
