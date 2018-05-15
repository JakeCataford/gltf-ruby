require 'dry-validation'

class GLTF
  module Schemas
    Nodes = Dry::Validation.Schema do
      each do
        schema do
          optional(:name).filled(:str?)
          optional(:mesh).filled(:int?)
          optional(:weights).filled(:int?)
          optional(:skin).filled(:int?)
          optional(:children).filled(:array?).each(:int?)
          optional(:rotation).filled(:array?, size?: 4).each(:float?)
          optional(:translation).filled(:array?, size?: 3).each(:float?)
          optional(:scale).filled(:array?, size?: 3).each(:float?)
          optional(:matrix).filled(:array?, size?: 16).each(:float?)
          optional(:camera).filled(:int?, included_in?: [0,1])
          optional(:skin).filled(:int?)
        end
      end
    end
  end
end
