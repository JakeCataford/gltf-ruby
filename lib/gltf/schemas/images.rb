require 'dry-validation'

class GLTF
  module Schemas
    Images = Dry::Validation.Schema do
      each do
        schema do
          optional(:uri).filled(:str?)
          optional(:bufferView).filled(:int?)
          optional(:mimeType).filled(:string?)
        end
      end
    end
  end
end
