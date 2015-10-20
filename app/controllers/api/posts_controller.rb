class Api::PostsController < Api::BaseController
  # load_and_authorize_resource
  skip_authorization_check

  def index
    Rails.logger.info("INSIDE post api INDEx")
    response = WpApi.get('get_posts', params)
    render json: response.body

    
  end

  def update

  end

private

  
end
