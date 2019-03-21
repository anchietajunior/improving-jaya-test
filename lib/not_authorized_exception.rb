class NotAuthorizedException < StandardError
  def initialize
    super("Request not authorized")
  end
end
