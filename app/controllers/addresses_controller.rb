class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Address'
    @address = @location.addresses.first
  end

  def show
    @title = 'Address'
  end

  # def new
  #   @title = 'Add New Address'
  #   @address = Address.new
  # end

  # def create
  #   @address = @location.addresses.new(address_params)
  #     if @address.save
  #       redirect_to location_address_path(@location, @address)
  #     else
  #       render :new
  #     end
  # end

  def edit
    @title = 'Edit This Address'
  end

  def update
    if @address.update(address_params)
      redirect_to location_address_path(@location, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to location_addresses_path(@location)
  end

  private
    def address_params
      params.require(:address).permit(:city, :state, :street, :zip, :location_id)
    end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = @location.addresses.find(params[:id])
  end

end
