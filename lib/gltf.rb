require 'open-uri'

require 'gltf/parser'
require 'gltf/invalid_property_error'
require 'gltf/has_validated_property'
require 'gltf/schemas/asset'
require 'gltf/schemas/nodes'
require 'gltf/schemas/scenes'
require 'gltf/schemas/buffers'
require 'gltf/schemas/buffer_views'
require 'gltf/schemas/meshes'
require 'gltf/schemas/accessors'
require 'gltf/schemas/skins'

class GLTF
  include HasValidatedProperty

  has_validated_property :accessors, Schemas::Accessors
  has_validated_property :asset, Schemas::Asset, allow_keys_not_in_schema: true
  has_validated_property :buffers, Schemas::Buffers
  has_validated_property :bufferViews, Schemas::BufferViews
  has_validated_property :meshes, Schemas::Meshes
  has_validated_property :nodes, Schemas::Nodes
  has_validated_property :scene, type: Integer
  has_validated_property :scenes, Schemas::Scenes
  has_validated_property :skins, Schemas::Skins

  def self.parse(uri)
    ext = File.ext_name(uri)
    if ext == 'glb'
      parser = BinaryFormatParser.new(open(url) { |f| f.read })
      parser.parse
    else
      parser = JSONFormatParser.new(open(url) { |f| f.read })
      parser.parse
    end
  end
end
