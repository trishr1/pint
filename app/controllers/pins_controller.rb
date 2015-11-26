class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @pins = Pin.all
   end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.build
    #respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    
    if @pin.save
       redirect_to @pin, notice: 'Pin was successfully created.'
    else   
      render action: 'new'
    end 
    #respond_with(@pin)
  end

  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
