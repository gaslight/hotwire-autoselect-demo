json = ActiveSupport::JSON.decode(File.read('db/seeds/parts.json'))
json.each do |record|
  Part.create!(record)
end
