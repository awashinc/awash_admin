class Admin::PaymentsController < ApplicationController
  def index
    @payments = Payment.page(params[:page]).per(30)
  end

 def show
   @payment = Payment.find(params[:id])
 end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to admin_payments_url, :notice => "Successfully created payment."
    else
      render :new
    end
  end

 def edit
   @payment = Payment.find(params[:id])
 end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(payment_params)
      redirect_to admin_payments_url, :notice  => "Successfully updated payment."
    else
      render :edit
    end
  end

  def create
    @payment = Payment.new(params[:payment])
    if @payment.save
      redirect_to admin_payments_url, :notice => "Successfully created payment."
    else
      render :new
    end
  end

  private
  def payment_params
    params.require(:payment).permit()
  end
end
