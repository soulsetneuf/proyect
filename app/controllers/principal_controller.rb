class PrincipalController < ApplicationController
  def index
    get_hospital
  end

  def get_hospital
    if params[:hospital].present?
      cookies[:hospital] = params[:hospital]
    else
      cookies[:hospital] = Hospital.first.id
    end
  end

  helper_method :get_hospital

end
