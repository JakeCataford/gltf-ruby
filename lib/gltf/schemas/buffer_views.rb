require 'dry-validation'

class GLTF
  module Schemas
    BufferViews = Dry::Validation.Schema do
      each do
        schema do
          required(:buffer).filled(:int?)
          required(:byteLength).filled(:int?)
          required(:byteOffset).filled(:int?)
          optional(:byteStride).filled(:int?)
          optional(:target).filled(:int?)
        end
      end
    end
  end
end
