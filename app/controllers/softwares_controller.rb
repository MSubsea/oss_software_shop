class SoftwaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @softwares = policy_scope(Software)
  end
end
