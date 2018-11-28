 # app/controllers/api/v1/lists_controller.rb
 class Api::V1::ListsController < Api::V1::BaseController
  before_action :set_list, only: [:show, :update, :destroy]
  def index
   @lists = List.all
 end

 def show
    # @cards = @list.cards
    render json: {
      list: @list,
      cards: @list.cards
    }
 end

 def update
   if @list.update(list_params)
     render :show
   else
     render_error
   end
 end

 def destroy
   @list.destroy
   head :no_content
 end

 def create
   @list = List.new(list_params)
   if @list.save
     render :show, status: :created
   else
     render_error
   end
 end

private

def set_list
 @list = List.find(params[:id])
end

private

def list_params
 params.require(:list).permit(:name, :text)
end

def render_error
 render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
end

end
