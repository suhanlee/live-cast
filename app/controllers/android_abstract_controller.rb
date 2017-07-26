class AndroidAbstractController < ApplicationController
  protect_from_forgery with: :null_session
  layout false
  before_filter :set_content_type

  include Exceptions

  rescue_from Exceptions::ParameterNotFulfilled do
    render json: { error_message: 'parameter_not_fulfilled' }, status: 412
  end

  rescue_from Exceptions::GoogleAccountNotVerified do
    render json: { error_message: 'google_account_not_verified'}, status: 401
  end

  rescue_from Exceptions::PushRegistrationFailed do
    render json: { error_message: 'push_registration_failed' }, status: 500
  end

  rescue_from Exceptions::UserUnAuthorized do
    render json: { error_message: 'user_unauthorized' }, status: 401
  end

  rescue_from Exceptions::UserFieldDuplicated do
    render json: { error_message: 'user_field_duplicated' }, status: 406
  end

  rescue_from Exceptions::CannotCreateRoom do
    render json: { error_message: 'cannot create room. retry again' }, status: 413
  end

  rescue_from Exceptions::CannotDeleteApplication do
    render json: { error_message: 'cannot delete room. retry again' }, status: 413
  end

  def set_content_type
    self.content_type = 'application/json'
  end
end