require 'dry-validation'

class GLTF
  module Schemas
    Scenes = Dry::Validation.Schema do
      each do
        schema do
          required(:magFilter).filled(:int?)
          required(:minFilter).filled(:int?)
          required(:wrapS).filled(:int?)
          required(:wrapT).filled(:int?)
        end
      end
    end
  end
end
