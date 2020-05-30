# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validates

    def validate(attr, type, *options)
      self.validates ||= []
      self.validates << { attr: attr, type: type, options: options }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |value|
        v = instance_variable_get("@#{value[:attr]}".to_sym)
        send(validate{value[:attr]}.to_sym, v, value[:options])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def presence(value, validate_options)
      raise 'Значение не может быть пустым' if value.empty?
    end

    def format(value, options)
      raise 'Неверный формат' if value !~ options
    end

    def type(value, options)
      raise 'Несоответствие класса' if value.class == options
    end
  end
end
