require 'active_support/concern'
require 'active_support'

class GLTF
  module HasValidatedProperty
    extend ActiveSupport::Concern

    included do
      def validate_property(property_name, value, schema)
        result = schema.call(value)

        if result.failure?
          raise InvalidPropertyError.new("#{property_name} was provided with an invalid value: #{result.errors}")
        end

        result.to_h
      end

      def set_property(property_name, value)
        ivar_name = :"@#{property_name}"
        instance_variable_set(ivar_name, value)
      end

      def get_property(property_name)
        ivar_name = :"@#{property_name}"
        instance_variable_get(ivar_name)
      end
    end

    class_methods do
      def has_validated_property(property_name, schema = nil, type: nil, allow_keys_not_in_schema: false)
        define_method(:"#{property_name}=") do |value|
          if type
            raise InvalidPropertyError.new("#{property_name} must be a #{type}") unless type.is_a? type
            set_property(property_name, value)
          else
            validated_value = validate_property(property_name, value, schema)
            set_property(property_name, validated_value)
          end
        end

        define_method(property_name) do
          get_property(property_name)
        end
      end
    end
  end
end
