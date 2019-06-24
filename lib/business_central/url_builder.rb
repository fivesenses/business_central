##
# Builds URLs for API access
#

module BusinessCentral
  class URLBuilder
    attr_reader :url
    attr_reader :parent_path, :parent_id
    attr_reader :child_path, :child_id, :sequence

    # @param parent_path [String] The path for the parent object
    # @param parent_id [String] The object ID
    # @param options [Hash] any associated child object
    #
    def initialize(parent_path, parent_id, options = {})
      @url = ""
      @parent_path = parent_path
      @parent_id = parent_id
      @child_path = options.fetch(:child_path, nil)
      @child_id = options.fetch(:child_id, nil)
      @sequence = options.fetch(:sequence, nil)
      build
    end

    # Creates the URL string from the provided options
    #
    def build
      @url = "/#{@parent_path}(#{@parent_id})"
      @url += "/#{@child_path}" unless @child_path.nil?
      @url += "(#{@child_id})" unless @child_id.nil?
    end
  end
end
