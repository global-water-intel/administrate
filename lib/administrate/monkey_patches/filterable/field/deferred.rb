module Administrate
  module MonkeyPatches
    module Filterable
      module Field
        module Deferred
          def filter_path
            to_partial_path(:filter)
          end

          def to_partial_path(page)
            "/fields/#{deferred_class.field_type}/#{page}"
          end

          def filterable?
            options.fetch(:filterable, deferred_class.filterable?)
          end

          def filterable_field
            ActiveSupport::Deprecation.warn(
              "filterable_field is deprecated, use filterable_fields instead",
            )
            options.fetch(:filterable_field)
          end

          def filterable_fields
            if options.key?(:filterable_field)
              [filterable_field]
            else
              options.fetch(:filterable_fields)
            end
          end
        end
      end
    end
  end
end
