require "active_support/concern"

module Administrate
  module MonkeyPatches
    module Filterable
      module Page
        module Collection
          def new_resource
            dashboard.class.model.new
          end

          def filter_attributes
            dashboard.attribute_types.map do |attribute_name, attribute_type|
              next unless attribute_type.filterable?

              attribute_field(dashboard, new_resource, attribute_name, :filter)
            end.compact
          end
        end
      end
    end
  end
end
