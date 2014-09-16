require_relative "./pointy/version"
require "httparty"
require "polylines"

module Pointy
  include HTTParty
  base_uri 'https://maps.googleapis.com/maps/api'

  default_params mode: 'walking'
  default_params sensor: 'false'
  default_params key: ENV['GOOGLE_DIRECTIONS_API_KEY']

  # from and to should be of format:
  # {
  #   lat: float
  #   long: float
  # }
  def self.route(from, to, opts={})
    return if default_params[:key].nil? and opts[:key].nil?

    # Format points for Google API
    opts.merge!({
      origin: "#{from[:lat]},#{from[:long]}",
      destination: "#{to[:lat]},#{to[:long]}"
    })

    response = get('/directions/json', query: opts)

    # Check there are routes
    routes = response['routes']
    return if routes.nil? or routes.empty?

    # Gather all route points
    route = routes.first
    legs = route['legs']
    return if legs.nil? or legs.empty?

    # Accumulate all points
    legs.inject([]) do |all_points, leg|
      steps = leg['steps']
      if !steps.nil? and !steps.empty?
        steps.each_with_index do |step, index|
          polyline = step['polyline']['points']
          decoded_poly = Polylines::Decoder.decode_polyline(polyline)
          all_points += decoded_poly.map do |coord|
            {
              lat: coord.first,
              long: coord.last
            }
          end
        end
      end

      all_points
    end
  end
end
