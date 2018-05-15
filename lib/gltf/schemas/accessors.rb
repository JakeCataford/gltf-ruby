require 'dry-validation'


class GLTF
  module Schemas
    Accessors = Dry::Validation.Schema do
      COMPONENT_TYPES = {
        component_type_byte: 5120,
        component_type_unsigned_byte: 5121,
        component_type_short: 5122,
        component_type_unsigned_short: 5123,
        component_type_unsigned_int: 5125,
        component_type_float: 5126,
      }

      DATA_TYPES = [
        "SCALAR",
        "VEC2",
        "VEC3",
        "VEC4",
        "MAT2",
        "MAT3",
        "MAT4",
      ]

      each do
        schema do
          required(:componentType).filled(:int?, included_in?: COMPONENT_TYPES.values)
          required(:type).filled(:str?, included_in?: DATA_TYPES)
          required(:bufferView).filled(:int?)
          required(:byteOffset).filled(:int?)
          required(:count).filled(:int?)

          optional(:min) { int? | float? }
          optional(:max) { int? | float? }

          optional(:sparse).schema do
            required(:count).filled(:int?)
            required(:indices).schema do
              required(:componentType).filled(:int?, included_in?: COMPONENT_TYPES.values)
              required(:bufferView).filled(:int?)
              required(:byteOffset).filled(:int?)
            end

            required(:values).schema do
              required(:bufferView).filled(:int?)
              required(:byteOffset).filled(:int?)
            end
          end
        end
      end
    end
  end
end
