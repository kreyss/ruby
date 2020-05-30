# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        @history ||= {}
        @history[name] ||= []
        @history[name] << value
        @history[name] << instance_variable_get("@#{var_name}")
      end
      define_method("#{name}_history") { @history ? @history[name] : [] }
    end
  end

  def strong_attr_accessor(name, v_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=") do |value|
      raise 'Error! Type mismatch' unless value.is_a?(v_class)

      instance_variable_set(var_name, value)
    end
  end
end
