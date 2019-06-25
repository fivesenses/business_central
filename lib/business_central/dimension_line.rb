##
# Provides access to the /dimensions/{Id}/dimensionsLine API
#

module BusinessCentral
  class DimensionLine < BusinessCentral::Base
    API_OBJECT_PARENT = "dimensions"
    API_OBJECT = "dimensionLines"

    def get(dimension_id, dimension_line_id=nil)
      get_child(dimension_id, dimension_line_id)
    end
  end
end
