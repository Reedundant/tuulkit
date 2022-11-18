class ToolsController < ApplicationController
  # before_action :set_tool, except: :destroy
  skip_before_action :authenticate_user!, only: %i[index show]

  #GET
  def index
    if params[:query].present?
      @tools = Tool.search_by_name_tool_type_and_location(params[:query])
    else
      @tools = Tool.all
    end

    @markers = @tools.geocoded.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude
      }
    end
  end

  # GET
  def show
    @tool = Tool.find(params[:id])

    # Geocoder: provides coordinates for all our tools instances
    @markers = [lat: @tool.latitude, lng: @tool.longitude]
  end

  # GET
  def new
    @tool = Tool.new
  end

  # POST
  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to my_tools_path, notice: "Your tool was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET
  def edit
    @tool = Tool.find(params[:id])
  end

  # PATCH
  def update
    @tool = Tool.find(params[:id])
    @tool.user = current_user
    if @tool.update(tool_params)
      redirect_to my_tools_path, notice: "Your tool was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tool = Tool.find(params[:id])

    @tool.destroy
    redirect_to my_tools_path, notice: "Your tool was successfully removed.", status: :see_other
  end

  def my_tools
    @my_tools = Tool.where(user: current_user)
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :tool_type, :price, :description, :location, :photo)
  end
end
