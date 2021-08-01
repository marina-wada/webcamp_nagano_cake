class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new
    @address.save
    redirect_to addresses_path
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end