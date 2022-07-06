class ReleasesController < ApplicationController
  def new
    @release = Release.new
    authorize @release
    @software = Software.find(params[:software_id])
  end

  def create
    @release = Release.new(release_params)
    authorize @release
    @software = Software.find(params[:software_id])
    @release.user = current_user
    @release.software = @software
    @release.save!
    redirect_to software_path(@software)
  end

  private

  def release_params
    params.require(:release).permit(:version_number, :software_url)
  end

end
