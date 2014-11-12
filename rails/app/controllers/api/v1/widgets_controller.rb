class Api::V1::WidgetsController < InheritedResources::Base 
  skip_before_action :verify_authenticity_token
  def index
    render json: Widget.all
  end

  def show
    render json: Widget.find(params[:id])
  end
  def permitted_params
      params.permit(:widget => [:title, :configuration_data])
  end
end
