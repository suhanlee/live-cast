module Exceptions
  class GoogleAccountNotVerified < StandardError; end
  class ParameterNotFulfilled < StandardError; end
  class ValidationFailed < StandardError; end
  class PushRegistrationFailed < StandardError; end
  class UserUnAuthorized < StandardError; end
  class UserFieldDuplicated < StandardError; end
  class CannotCreateRoom < StandardError; end
  class CannotDeleteApplication < StandardError; end
end