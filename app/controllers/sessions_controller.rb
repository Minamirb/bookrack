require 'rubygems'
require 'twitter_oauth'
class SessionsController < ApplicationController
  CS_KEY = '3NC62rJtsXLwfJ02di1ww'
  CS_SEC = 'UCsq2rlVaxZrxDaJuYLAgt8e95xRacUoWsq4e4zpAkE'
  def new
  end

  def oauth
    call_back_url = 'http://localhost:3000/oauth_c'
    client = TwitterOAuth::Client.new(
      :consumer_key => CS_KEY,
      :consumer_secret => CS_SEC
    )
    request_token = client.request_token(:oauth_callback => call_back_url)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end

  def oauth_c
    request_token        = session[:request_token]
    request_token_secret = session[:request_token_secret]
    client = TwitterOAuth::Client.new(
      :consumer_key => CS_KEY,
      :consumer_secret => CS_SEC
    )

    access_token = client.authorize(
      request_token,
      request_token_secret,
      :oauth_verifier => params[:oauth_verifier]
    )

    if client.authorized?
      info = client.info
      id = info["screen_name"]
      redirect_to :controller => :books, :action => :index, :id =>  id
    else
      #flash[:info] = "ログインに失敗したのでもう一度がんばってね"
      redirect_to :action => :new
    end
  end

end
