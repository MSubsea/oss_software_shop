class SoftwaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_software, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      @softwares = policy_scope(Software).search_by_title_and_description(params[:query])
    else
      @softwares = policy_scope(Software)
    end
  end

  def show
    authorize @software
    @geojson = Array.new()
    @geojson << {
      lat: @software.latitude,
      lng: @software.longitude,
      image_url: helpers.asset_url("platform.png"),
      info_window: render_to_string(partial: "label")
    }
    @review = Review.new
  end

  def create
    @software = Software.new(software_params)

    authorize @software

    if @software.save
      redirect_to software_path(@software)
    else
      render :new
    end
  end

  def new
    @software = Software.new
    authorize @software
    @customers = Customer.all
    @collection = @customers.map { |c| [c.name, c.id] }
    @selected = 0
  end

  def destroy
    @software = Software.find(params[:id])
    authorize @software
    @software.destroy
    redirect_to softwares_path
  end

  def edit
    authorize @software
    @customers = Customer.all
    @collection = @customers.map { |c| [c.name, c.id] }
    @selected = @software.customer.id
  end

  def update
    authorize @software
    @software.update(software_params)

    redirect_to software_path(@software)
  end

  private

  def find_software
    @software = Software.find(params[:id])
  end

  def software_params
    params.require(:software).permit(:title, :description, :price, :photo, :customer_id, :latitude, :longitude)
  end
end
