module Administrate
  class AdvancedSearch
    attr_accessor :advanced_filters, :page

    def initialize(scoped_resource, dashboard_class, filters)
      @dashboard_class = dashboard_class
      @scoped_resource = scoped_resource
      @advanced_filters = filters.presence || {} # select keys that are part of allowed filterables
    end

    def run
      @advanced_filters.each do |attr_name, filter_value|
        present_filters = Array(filter_value).select(&:present?)
        next unless present_filters.present?

        @scoped_resource = @scoped_resource.where(attr_name => present_filters)
      end

      @scoped_resource
    end

    def allowed_filters
      @advanced_filters
    end

    def filter_fields
      page.filter_attributes
    end

    def form_object
      page.new_resource
    end

    private

    def attribute_types
      @dashboard_class::ATTRIBUTE_TYPES
    end
  end
end
