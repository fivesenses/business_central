##
# Provides access to the /dimensions/{Id}/dimensionsLine API
#

module BusinessCentral
  class DimensionLine < BusinessCentral::Base
    API_OBJECT_PARENT = "dimensions"
    API_OBJECT = "dimensionLines"

    def get(dimension_id, dimension_line_id=nil)
      url = build_url(dimension_id, build_options(dimension_line_id))

      response = @client.get(url)
      handle_error(response)
      results = process(response)

      if results.is_a?(Array)
        return results.first if results.length == 1
        return results
      end
    end
  end
end
