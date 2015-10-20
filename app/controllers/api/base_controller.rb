require 'faraday'
require_relative '../../services/wp_api.rb'

class Api::BaseController < ActionController::API
  include CanCan::ControllerAdditions
  helper_method :current_user

  clear_respond_to
  respond_to :json

  
  # before_action :doorkeeper_authorize!
  before_action :authenticate_user!
  

  check_authorization unless: :devise_controller?

  # rescue_from Exception, with: :flash_error

# def doorkeeper_unauthorized_render_options(error: nil)
#   Rails.logger.info("INSIDE unauthorized render options");
#       end

#       def doorkeeper_forbidden_render_options(error: nil)
#         Rails.logger.info("INSIDE forbidden render options");
#       end
  # private
  def flash_error
    Rails.logger.info("INSIDE ERROR");
      # flash_message :error, 'Something went wrong..' # _FLASH_
      # flash[:error] = "#{exception.message} (Something went wrong..)" # _FLASH_
    redirect_to new_user_session_path
  end

  rescue_from CanCan::AccessDenied do |e|    
    Rails.logger.info("INSIdE RESCUE")
    render json: errors_json(e.message), status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: errors_json(e.message), status: :not_found
  end

private

  def authenticate_user!
    Rails.logger.info(doorkeeper_token);
    Rails.logger.info(current_user);    
    if doorkeeper_token
      Thread.current[:current_user] = User.find(doorkeeper_token.resource_owner_id)
    end

    return true if current_user
    doorkeeper_authorize!

    # render json: { errors: ['User is not authenticated!'] }, status: :unauthorized
  end

  def current_user
    @current_user ||= Thread.current[:current_user]
  end

  def errors_json(messages)
    { errors: [*messages] }
  end
end
