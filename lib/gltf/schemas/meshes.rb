require 'dry-validation'

class GLTF
  module Schemas
    MeshPrimitiveAttributes = Dry::Validation.Schema do
      optional(:POSITION).filled(:int?)
      optional(:NORMAL).filled(:int?)
      optional(:TANGENT).filled(:int?)
      optional(:TEXCOORD_0).filled(:int?)
      optional(:TEXCOORD_1).filled(:int?)
      optional(:COLOR_0).filled(:int?)
      optional(:JOINTS_0).filled(:int?)
      optional(:WEIGHTS_0).filled(:int?)
    end

    MeshPrimitives = Dry::Validation.Schema do
      each do
        schema do
          required(:attributes).schema(MeshPrimitiveAttributes)
          optional(:indices).filled(:int?)
          optional(:material).filled(:int?)
          optional(:mode).filled(:int?)

          optional(:targets).each do
            schema do
              optional(:POSITION).filled(:int?)
              optional(:NORMAL).filled(:int?)
              optional(:TANGENT).filled(:int?)
            end
          end
        end
      end
    end

    Meshes = Dry::Validation.Schema do
      each do
        schema do
          required(:primitives).schema(MeshPrimitives)
          optional(:name).filled(:str?)
          optional(:weights).each(:float?)
        end
      end
    end
  end
end
