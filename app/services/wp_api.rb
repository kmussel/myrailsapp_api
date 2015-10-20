class WpApi

  attr_reader :conn

  class << self
    def post(url="/", params={})
      api = self.new
      api.conn.params = params
      response = api.conn.post(url)      
    end

    def get(url="/", params={})
      api = self.new      
      api.conn.params = params
      response = api.conn.get(url)      
    end

    private

  end

  def initialize
    
    @conn = Faraday.new(:url => 'https://wp.myapp.dev/api/', :ssl => {:verify => false})    
    @conn.basic_auth('api', '14tt@5%(U#GUpvfXE$y)MGH7')

  end

  private


end

