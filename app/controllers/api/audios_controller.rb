class Api::AudiosController < Api::BaseController
  # load_and_authorize_resource
  skip_authorization_check

  def index
    Rails.logger.info("INSIDE audio api INDEx")
    params["post_type"] = "attachment"
    response = WpApi.get('get_posts', params)
    # https://api.coretraining.dev/api/posts?post_type=attachment
    # conn = Faraday.new(:url => 'https://web.coretraining.dev') do |c|
    #   c.use Faraday::Request::UrlEncoded  # encode d params as "www-form-urlencoded"
    #   c.use Faraday::Response::Logger     # log request & response to STDOUT
    #   c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP

    # end

    # conn = Faraday.new(:url => 'https://web.coretraining.dev', :ssl => {:verify => false})
    # conn.basic_auth('login', 'test')
    # # conn.basic_auth('api', 'BVjYp#d#zik(VzS8YG^kW0b*')
    # conn.params = params;
    # response = conn.get '/audio'

    # Rails.logger.info(JSON.parse(response.body)['posts'])
    obj = JSON.parse(response.body)
    Rails.logger.info(obj["posts"])

    render json: obj["posts"].to_json

    # users = User.accessible_by(current_ability).all

    # render json: { users: users }, each_serializer: UserSerializer
  end

  def update
    # user = User.find(params[:id])
    # if user.update(update_params)
    #   render json: user, serialzier: UserSerializer, status: 200
    # else
    #   render json: { errors: user.errors }, status: 422
    # end
  end

private

  def update_params
    params.permit(:email, :password)
  end
end
