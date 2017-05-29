class Admin::WashingsController < Admin::ApplicationController
  def index
    @washings = Washing.page(params[:page]).per(30)
  end

 def show
   @washing = Washing.find(params[:id])
 end

  def new
    @washing = Washing.new
  end

  def create
    binding.pry
    @washing = Washing.new(washing_params)
    if @washing.save
      redirect_to admin_washings_url, :notice => "Successfully created washing."
    else
      render :new
    end
  end

 def edit
   @washing = Washing.find(params[:id])
 end

  def update
    @washing = Washing.find(params[:id])
    if @washing.update_attributes(washing_params)
      redirect_to admin_washings_url, :notice  => "Successfully updated washing."
    else
      render :edit
    end
  end

  def destroy
    @washing = Washing.find(params[:id])
    @washing.destroy
    redirect_to admin_washings_url, :notice => "Successfully destroyed washing."
  end

  def schedule_register


    cal = Google::Calendar.new(:client_id     =>  "891105199825-5bsgp4mnc0fijqhphtpi97f0k506b8os.apps.googleusercontent.com"  , 
                               :client_secret =>  "kamXbuZYolf-34PrFk-cRJlH" ,
                               :calendar      =>  "#contacts@group.v.calendar.google.com",
                               :redirect_url  => "http://bdb64704.ngrok.io/callback"
                               )
    cal.login_with_auth_code("4/NsuQCABQd_gdWd0_hHN-E6qfXKmU3rivNLHcqPi6YMI")
    cal.login_with_refresh_token("1/oNvgphM4WXj2mUgY4ecEa-KtSjcORbd1gdWeSImfdkc")

    cal.find_events_in_range(Time.now - 1.months, Time.now)

  end
  private
  def washing_params
    params.require(:washing).permit(:user_id, :car_id, :washer_id, :wash_date, :washer_comment,\
                                    :service_part, :is_inner_clean, :start_time, :end_time, :picture)
  end
  def washing_params1
    params.require(:washing).permit(:user_id, :car_id, :washer_id, :wash_date, :washer_comment, :service_part, :start_time, :end_time )
  end
end
