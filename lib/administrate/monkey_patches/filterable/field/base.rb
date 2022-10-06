require "active_support/concern"

module Administrate
  module MonkeyPatches
    module Filterable
      module Field
        module Base
          extend ActiveSupport::Concern

          included do
          end

          class_methods do
            def filterable?
              false
            end

            def to_partial_path(page)
              "/fields/#{field_type}/#{page}"
            end

            def filter_path(filter)
              to_partial_path(:filter)
            end
          end

          def filter_field_values
            resource.class.group(attribute).count.keys.map(&:to_s).sort
          end
        end
      end
    end
  end
end
