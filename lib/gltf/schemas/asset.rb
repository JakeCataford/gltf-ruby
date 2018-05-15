require 'dry-validation'

class GLTF
  module Schemas
    Asset = Dry::Validation.Schema do
      required(:version).filled(:str?, format?: /\d\.\d/)
      optional(:minVersion).filled(:str?, format?: /\d\.\d/)
    end
  end
end
