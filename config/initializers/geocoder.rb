Geocoder.configure(
  # Geocoding options
  # timeout: 3,                 # geocoding service timeout (secs)
  # lookup: :nominatim,         # name of geocoding service (symbol)
  # ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
  # language: :en,              # ISO-639 language code
  # use_https: false,           # use HTTPS for lookup requests? (if supported)
  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  # api_key: nil,               # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  # units: :mi,                 # :km for kilometers or :mi for miles
  # distances: :linear          # :spherical or :linear

  # Cache configuration
  # cache_options: {
  #   expiration: 2.days,
  #   prefix: 'geocoder:'
  # }

  # geocoding service:
  :lookup => :google,
   

  # IP address geocoding service:
 #:ip_lookup => :maxmind,

  # to use an API key:
  #:api_key => 'AIzaSyA0R4dEs6Ni0LhoIA9vfYxpD6f3Hnhk9BY',

   :api_key => ENV['GOOGLE_GEOCODER_API_KEY'],
  

  # :api_key => Rails.application.credentials.GOOGLE_GEOCODER_API_KEY,
 

  # this is very important option for configuring geocoder with API key
  :use_https => true,

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 3,

  # set default units to kilometers:
  :units => :mi,
)
