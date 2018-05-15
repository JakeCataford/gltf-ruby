require 'dry-validation'

class GLTF
  module Schemas
    Textures = Dry::Validation.Schema do
      each do
        schema do
          optional(:name).filled(:str?)
          required(:sampler).filled(:int?)
          required(:source).filled(:int?)
        end
      end
    end
  end
end
