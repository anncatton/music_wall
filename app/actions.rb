# Homepage (Root path)
get '/' do
  erb :index
end


# Song Title (required)
# Author (required)
# URL (optional)
# Timestamps (created_at and updated_at, as you should have with all tables)