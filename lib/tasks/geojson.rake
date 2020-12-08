namespace :geojson do

  desc "creates json for Groups"
  task create_json: :environment do

    require 'rgeo'

    groups = []
    Group.all.each do |group|
      factory = RGeo::GeoJSON::EntityFactory.instance
      feature = factory.feature group.geometry
      hash = RGeo::GeoJSON.encode feature
      groups << hash
    end
    File.open('public/groups.json', 'w') {|file| file.write groups.to_json}
  end
end