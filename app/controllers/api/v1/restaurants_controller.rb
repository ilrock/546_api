class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]  

  def index
    @restaurants = policy_scope(Restaurant)
    # DON'T DO THIS
    # @restaurants = Restaurant.all 
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    authorize @restaurant

    @restaurant.update!(restaurant_params)

    render :show
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.user = current_user

    authorize @restaurant

    if @restaurant.save
      render :show
    else
      # here you should render the error
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant

    @restaurant.destroy!

    head :no_content
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
