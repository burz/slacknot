class HomeController < ApplicationController
  def index
    respond_to do |format|
      if user_signed_in?
        format.html { redirect_to user_pipeline_path(current_user) }
      else
        format.html { render :index }
      end
    end
  end
end
