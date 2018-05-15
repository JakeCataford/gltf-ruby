require 'dry-validation'

class GLTF
  module Schemas
    Buffers = Dry::Validation.Schema do
      each do
        schema do
          required(:byteLength).filled(:int?)
          optional(:uri).filled(:str?)
        end
      end
    end
  end
end
