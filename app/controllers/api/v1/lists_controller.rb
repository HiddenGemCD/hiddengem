 class Api::V1::ListsController < Api::V1::BaseController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
   @lists = List.all

   render json: {
     lists: @lists
   }
 end

 def show_user_lists
  @user_lists = List.where(user_id: params[:id] )
  puts @user_cards
  render json: {
    lists: @user_lists
  }
end

 def show
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
   @list.user_id = params[:id] if params[:id]
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

  def list_params
    params.require(:list).permit(:name)
  end

  def render_error
    render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
  end

end
