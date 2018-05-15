require 'dry-validation'

class GLTF
  module Schemas
    MaterialTexture = Dry::Validation::Schema do
      required(:index).filled(:int?)
      required(:scale).filled(:float?)
      required(:texCoord).filled(:int?)
    end

    Material = Dry::Validation.Schema do
      each do
        schema do
          optional(:name).filled(:str?)
          optional(:pbrMetallicRoughness).schema do
            optional(:baseColorFactor).filled(:array?, size: 4).each(:float?)
            optional(:metallicFactor).filled(:float?)
            optional(:roughnessFactor).filled(:float?)
            optional(:baseColorTexture).schema(MaterialTexture)
            optional(:metallicRoughnessTexture).schema(MaterialTexture)
          end

          optional(:normalTexture).schema(MaterialTexture)
          optional(:emissiveFactor).filled(:array?, size: 3).each(:float?)
          optional(:alphaMode).filled(:str?, included_in?: ["OPAQUE", "MASK", "BLEND"])
          optional(:doubleSided).filled(:bool?)
        end
      end
    end
  end
end
