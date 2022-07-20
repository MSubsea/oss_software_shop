class CustomersController < ApplicationController
  def index
    @customers = policy_scope(Customer)
  end

  def destroy
    @customer = Customer.find(params[:id])
    authorize @customer
    @customer.destroy
    redirect_to customers_path
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    @customer.save!
    redirect_to customers_path
  end

  def edit
    @customer = Customer.find(params[:id])
    authorize @customer
  end

  def update
    @customer = Customer.find(params[:id])
    authorize @customer
    @customer.update(customer_params)

    redirect_to customers_path
  end

  def show
    @customer = Customer.find(params[:id])
    authorize @customer
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :photo)
  end
end
