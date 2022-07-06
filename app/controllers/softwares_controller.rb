class SoftwaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :find_software, only: [:show]

  def index
    @softwares = policy_scope(Software)
  end

  def show
    authorize @software
  end

  private

  def find_software
    @software = Software.find(params[:id])
  end

  def software_params
    params.require(:software).permit(:title, :image_url, :description, :price)
  end
end
