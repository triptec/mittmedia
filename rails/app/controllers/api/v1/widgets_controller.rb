class Api::V1::WidgetsController < ApplicationController
  def index
    render json: Widget.all
  end

  def show
    render json: Widget.find(params[:id])
  end
end
