class ToolsController < ApplicationController
  before_action :set_tool, only: %[ show edit update destroy ]
### do i need a before action????

  #GET
  def index
    @tools = Tool.all
  end
  #GET
  # def show
  # end
#   #GET
  def new
    @tool = Tool.new
  end
#   #POST
#   def create
#     @tool = Tool.new(tool_params)

#     if @tool.save
#       redirect_to @tool, notice: "Your tool was successfully added!"
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end
#   #GET
#   def edit
#   end
#   #PATCH
#   def update
#     if @tool.update(tool_params)
#       redirect_to @tool, notice: "Your tool was successfully updated"
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     tool.destroy
#     redirect_to tools_url, notice: "Tool was successfully removed."
#   end

#   def my_tools ##view all tools that belong to owner??
#   end

#   private ##strong params

#   def set_tool
#     @tool = Tool.find(params[:id])
#   end

#   def tool_params #####THIS NEEDS TO BE COMPLETED WITH THE
#     params.require(:tool).permit()
#   end
end
