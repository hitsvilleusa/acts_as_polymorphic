module ActiveRecord
  module Acts
    module <%= class_name %>
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_<%= singular_name %>
          class_eval <<-EOV
            include ActiveRecord::Acts::<%= class_name %>::InstanceMethods

            has_many :<%= association_name              %>, :class_name => "<%= association_class_name %>",
                      <%= ' ' * association_name.length %>  :as         => :<%= singular_name %>,
                      <%= ' ' * association_name.length %>  :dependent  => :<%= dependency_style %>
          EOV
        end
      end

      module InstanceMethods
        # Add instance methods here for the <%= plural_name %>
      end 
    end
  end
end

ActiveRecord::Base.class_eval { include ActiveRecord::Acts::<%= class_name %> }