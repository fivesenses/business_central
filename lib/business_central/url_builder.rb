##
# Builds URLs for API access
#

module BusinessCentral
  class URLBuilder
    attr_reader :url
    attr_reader :parent_path, :parent_id
    attr_reader :child_path, :child_id, :sequence

    def initialize(parent_path, parent_id, options = {})
      @url = ""
      @parent_path = parent_path
      @parent_id = parent_id
      @child_path = options.fetch(:child_path, nil)
      @child_id = options.fetch(:child_id, nil)
      @sequence = options.fetch(:sequence, nil)
      build
    end

    def build
      @url = "/#{@parent_path}(#{@parent_id})"
      @url += "/#{@child_path}" unless @child_path.nil?
      @url += "?(#{parameters})" unless @child_id.nil?
    end

    def parameters
      [@child_id, @sequence].compact.join(", ")
    end
  end
end
