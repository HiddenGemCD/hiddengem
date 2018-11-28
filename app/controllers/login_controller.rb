class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    URL = "https://api.weixin.qq.com/sns/jscode2session".freeze 
    
    def wechat_params
        { appid: ENV['APPID'],
          secret: ENV['SECRET'],
          js_code: params[:code], grant_type: "authorization_code" }
    end

    def wechat_user
        @wechat_response ||= JSON.parse(RestClient.post( URL, wechat_params )) 
    end

    def login
        @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
        render json: { userId: @user}
    end
end
