class ReleasesController < ApplicationController
  def new
    @release = Release.new
    authorize @release
    @software = Software.find(params[:software_id])
  end
end
