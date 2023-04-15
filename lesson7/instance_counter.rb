# frozen_string_literal: true

require 'pry'

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def count_instances
      @instances
    end

    private

    def add_instances
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.send(:add_instances)
    end
  end
end
