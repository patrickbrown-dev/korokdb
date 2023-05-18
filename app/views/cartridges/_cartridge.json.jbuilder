json.extract! cartridge, :id, :game_id, :code, :build, :revision, :region, :game_version, :created_at, :updated_at
json.url cartridge_url(cartridge, format: :json)
