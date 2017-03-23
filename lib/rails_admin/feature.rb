require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Feature < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :link_icon do
          'icon-star'
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :visible? do
          bindings[:controller].action_name == 'index' &&
          !bindings[:object].featured
        end

        register_instance_option :controller do
          Proc.new do
            if @object.featured
              flash[:notice] = "#{@object.label} already featured!"
            else
              @object.featured = true
              @object.save
              flash[:notice] = "#{@object.label} has been featured!"
              redirect_to back_or_index
            end
          end
        end

        register_instance_option :pjax? do
          false
        end
      end

      class Unfeature < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :link_icon do
          'icon-star-empty'
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :visible? do
          bindings[:controller].action_name == 'index' &&
          bindings[:object].featured
        end

        register_instance_option :controller do
          Proc.new do
            if !@object.featured
              flash[:notice] = "#{@object.label} already un-featured!"
            else
              @object.featured = false
              @object.save
              flash[:notice] = "#{@object.label} has been un-featured!"
              redirect_to back_or_index
            end
          end
        end

        register_instance_option :pjax? do
          false
        end
      end
    end
  end
end