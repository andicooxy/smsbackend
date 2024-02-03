Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: :any,
             expose: %w[
               access-token
               expire-at
               refresh-token
               content-disposition
               content-type
             ]
  end

  allow do
    origins 'https://staging.farmradio.io'
    resource '*', 
    headers: :any, 
    methods: %i[get post put patch delete options head],
    expose: %w[
      access-token
      expire-at
      refresh-token
      content-disposition
      content-type
    ]
  end

  allow do
    origins 'https://interactive.farmradio.io'
    resource '*', 
    headers: :any, 
    methods: %i[get post put patch delete options head],
    expose: %w[
      access-token
      expire-at
      refresh-token
      content-disposition
      content-type
    ]
  end

  allow do
    origins 'http://localhost:3001' # Allow your development frontend
    resource '*', 
    headers: :any,
    methods: %i[get post put patch delete options head],
    expose: %w[
      access-token
      expire-at
      refresh-token
      content-disposition
      content-type
    ]
  end
end
