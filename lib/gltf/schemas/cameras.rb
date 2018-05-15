require 'dry-validation'

class GLTF
  module Schemas
    Images = Dry::Validation.Schema do
      CAMERA_TYPES = ["perspective", "orthographic"]
      each do
        schema do
          optional(:name).filled(:str?)
          optional(:type).filled(:str?, included_in?: CAMERA_TYPES)

          optional(:perspective).schema do
            required(:aspectRatio).filled(:float?)
            required(:yfov).filled(:float?)
            required(:znear).filled(:float?)
            optional(:zfar).filled(:float?)
          end

          optional(:orthographic).schema do
            required(:xmag).filled(:float?)
            required(:ymag).filled(:float?)
            required(:zfar).filled(:float?)
            required(:znear).filled(:float?)
          end
        end
      end
    end
  end
end
