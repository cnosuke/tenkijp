require 'rest-client'
require 'json'

module TenkiJp
  class Client
    API_BASE_URL = 'http://az416740.vo.msecnd.net/component/static_api/app/'

    RequestHeaders = {
      host: "az416740.vo.msecnd.net",
      accept: "*/*",
      user_agent: "tenkijp1/3.1.2.1 CFNetwork/711.5.6 Darwin/14.0.0",
      accept_language: "ja-jp",
    }

    class << self
      def get(location_id = 13113)
        JSON.parse exec(location_id)
      end

      def exec(location_id)
        RestClient::Request.execute(
          method: :get,
          url: api_url(location_id),
          headers: RequestHeaders
        )
      end

      def api_url(location_id)
        "#{API_BASE_URL}forecast_#{location_id}.json"
      end
    end
  end
end
