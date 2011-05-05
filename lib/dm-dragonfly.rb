require 'dragonfly'

module Dragonfly
  module DataMapperExtensions
    def self.extended(klass)
      klass.extend(ClassMethods)
      klass.extend(ActiveModelExtensions::ClassMethods)
      
      klass.class_eval do
        include InstanceMethods
        include ActiveModelExtensions::InstanceMethods
      end
    end
    
    module ClassMethods
      def before_save(method)
        unless hooks[:save][:before].map{|h| h.instance_variable_get(:@method)}.include?(method)
          before(:save, method)
        end
      end
      
      def before_destroy(method)
        unless hooks[:destroy][:before].map{|h| h.instance_variable_get(:@method)}.include?(method)
          before(:destroy, method)
        end
      end
    end
    
    module InstanceMethods
      def dirty_self?
        dragonfly_attachments.keys.any?{|k| !!send(k) && !send("#{k}_uid")} || super
      end
    end
  end
  
  class App
    def define_dm_macro(mod, macro_name)
      app = self
      (class << mod; self; end).class_eval do
        alias included_without_dragonfly included
        define_method :included_with_dragonfly do |mod|
          included_without_dragonfly(mod)
          mod.extend(DataMapperExtensions)
          mod.register_dragonfly_app(macro_name, app)
        end
        alias included included_with_dragonfly
      end
    end
  end
end
