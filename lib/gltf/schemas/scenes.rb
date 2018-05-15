require 'dry-validation'

class GLTF
  module Schemas
    Scenes = Dry::Validation.Schema do
      each do
        schema do
          required(:name).filled(:int?)
          required(:nodes).filled(:array?).each(:int?)
        end
      end
    end
  end
end
