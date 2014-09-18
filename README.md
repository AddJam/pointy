# Pointy

Uses Google Directions API to get a list of points between two locations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pointy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pointy

## Usage

1) Set the environment variable `GOOGLE_DIRECTIONS_API_KEY` to your Google Directions API key.

2) Use the route method to retrieve points between two locations.

    Pointy.route(from, to)

`from` and `to` should be hashes of the following format
    
    {
      lat: 55.8580,
      long: -4.2590
    }

The returned array of points are of the same format. If you would rather an
array of
[polylines](https://code.google.com/apis/maps/documentation/utilities/polylinealgorithm.html) then call `Pointy.route_polylines(from, to)` instead.

You can also pass in any other query parameters accepted by Google, so you override the API key or transport mode

    Pointy.route(from, to, {key: 'my-api-key', mode: 'walking'})
    
The mode defaults to 'walking' and sensor defaults to false.

## Contributing

1. Fork it ( https://github.com/addjam/pointy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
