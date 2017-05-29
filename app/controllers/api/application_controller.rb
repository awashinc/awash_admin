class Api::ApplicationController < ActionController::Base

  before_filter :flexible_authenticate_user

  before_filter :create_json_object
  helper_method :current_user
  protect_from_forgery with: :exception


  def authenticate_user
=begin
    if params[:token].present?
      @current_user = User.find_by_access_token(params[:token])
      @current_user = nil if @current_user.present? &&  @current_user.is_deleted == 1
    end
=end

    if @current_user.nil?
      @jsonResult = JsonResult.new
      @jsonResult.status = false
      @jsonResult.message = "로그인이 필요한 기능입니다.\n로그인이나 회원가입 후 이용해 주세요."
      render json: @jsonResult
    end
  end

  def flexiable_authenticate_user
    if params[:token].present?
      @current_user = User.find_by_access_token(params[:token])
    end
  end

  def current_user
    @current_user
  end


end
