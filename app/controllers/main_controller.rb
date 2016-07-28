class MainController < ApplicationController
  def index
  	orig_response = RestClient.get 'http://ip-api.com/json'
    case orig_response.code
      when 200
        render json: {response: JSON.parse(orig_response.body)}, status: :ok
      when 400..409
        render json: {response: "Bad Request"}, status: :bad_request
      when 500..509
        render json: {response: "Server Error"}, status: :un_processible_entity
      else
        render json: {response: "Unknown Request"}, status: :un_processible_entity
    end

  end
end
