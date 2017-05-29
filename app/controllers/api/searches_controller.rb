class Api::SearchesController < ApplicationController
  def index
    @searches = Search.page(params[:page]).per(30)
  end


  def find_user

    users= User.where("username like ?", "%#{params[:term]}%")
    render json: users.map {|x| {id: x.id, value: "#{x.username}"}} 

  end

  def find_user_cars

    cars = Car.where("car_number like ? and user_id = ?", "%#{params[:term]}%", params[:user_id])
    render json: cars.map {|x| {id: x.id, value: "#{x.car_number}"}}

  end

  def get_latlon
    url = "#{DAUM_FIND_LATLON_URL}&q=#{params[:addr]}"
    uri = URI(URI::escape(url))
    res = JSON.parse(Net::HTTP.get(uri))
    res = res["channel"]["item"]
    render json: res
  end

  def get_user_cars

    cars = Car.where(user_id: params[:user_id])
    render json: cars.map {|x| {id: x.id, number: x.car_number, name: x.car_name, spot: x.spot, lat: x.latitude, lon: x.longitude }}

  end



  private
  def search_params
    params.require(:search).permit()
  end
end
