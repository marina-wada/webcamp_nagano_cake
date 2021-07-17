class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page])
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def show
    @customer = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.save(customer_params)
    redirect_to admin_customer_path(@customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :adress, :telephone_number, :is_deleted)
  end
end
