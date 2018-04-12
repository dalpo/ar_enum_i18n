# frozen_string_literal: true

module ArEnumI18n
  class Error < StandardError; end

  def self.included(klass)
    klass.instance_eval do
      extend ::ArEnumI18n::ClassMethods
    end
  end

  module ClassMethods
    def translate_enum_i18n(key, enum_value)
      return nil if enum_value.blank?
      I18n.t [:activerecord, :enum, name.underscore, key, enum_value].join('.'),
             default: enum_value.to_s.humanize
    end

    def initialize_enum_i18n(key)
      method_name = :"human_#{key}"
      pluralized_key = key.to_s.pluralize

      define_singleton_method method_name do |enum_value|
        translate_enum_i18n(key, enum_value)
      end

      # The first argument indicate if the enum should countain
      # integer or string value into the array
      define_singleton_method :"#{key}_enum" do |*args|
        with_integer_values = args[0] == true
        enum_definition = send(pluralized_key)

        enum_definition.keys.map do |value|
          [
            send(method_name, value),
            with_integer_values ? enum_definition[value] : value
          ]
        end
      end

      define_method method_name do
        self.class.send method_name, public_send(key)
      end
    end

    def enum_i18n?(key)
      respond_to?(:"human_#{key}")
    end

    def enum_i18n(*args)
      args.each do |key|
        raise ArEnumI18n::Error, "Already initialized enum_i18n #{key}" if enum_i18n?(key)
        Rails.logger.debug "Defining i18n enum methods for #{name}##{key}"
        initialize_enum_i18n(key)
      end
    end
  end
end

require "ar_enum_i18n/version"
