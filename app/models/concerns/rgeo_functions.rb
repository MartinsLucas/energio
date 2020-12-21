# frozen_string_literal: true

# RGeo related functions
module RgeoFunctions
  extend ActiveSupport::Concern

  included do
    def create_rgeo_feature
      return unless geometry_is_valid?

      RGeo::GeoJSON::EntityFactory
        .instance
        .feature(geometry,
                 cod_id,
                 build_properties)
    end

    def build_properties
      properties = {}
      properties[:name] = if defined?(nom) && nom.present?
        nom
      else
        "#{self.class.name} ##{cod_id}"
      end

      properties[:description] = if defined?(descr) && descr.present?
        descr
      else
        self.class.name.to_s
      end

      properties
    end

    def geometry_is_valid?
      RGeo::Geos.is_geos? geometry
    end
  end

  class_methods do
    def create_rgeo_feature_colection(objects)
      collection = []
      objects.each do |object|
        collection << object.create_rgeo_feature
      end
      RGeo::GeoJSON::FeatureCollection.new(collection) || {}
    end

    def genetrates_geojson(feature)
      RGeo::GeoJSON.encode feature
    end
  end
end
