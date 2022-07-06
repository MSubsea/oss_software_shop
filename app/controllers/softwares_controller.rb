class SoftwaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :find_software, only: [:show, :edit, :update]

  def index
    @softwares = policy_scope(Software)
  end

  def show
    authorize @software
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
  end

  def destroy
    @software = Software.find(params[:id])
    @software.destroy
    redirect_to softwares_path
  end

  def edit
    authorize @software
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
    params.require(:software).permit(:title, :image_url, :description, :price)
  end
end
