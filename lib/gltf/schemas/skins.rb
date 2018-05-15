require 'dry-validation'

class GLTF
  module Schemas
    Skins = Dry::Validation.Schema do
      each do
        schema do
          optional(:name).filled(:str?)
          required(:inverseBindMatrices).filled(:int?)
          required(:joints).filled(:array?).each(:int?)
          required(:skeleton).filled(:int?)
        end
      end
    end
  end
end
