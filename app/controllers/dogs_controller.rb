class DogsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_dog, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access, only: [:edit, :update, :destroy]

  def new
    @dog = Dog.new
    @size = Size.all
  end

  def create
    @dog = Dog.new(dog_params)
    @size = Size.all
    @dog.user = current_user
    if @dog.save
        flash[:success] = 'New dog profile created!'
        redirect_to dog_path(@dog)
    else
      flash[:error] = 'Please see errors below'
      render :new
    end
  end

  def show
  end

  def index
    @dogs = Dog.order(created_at: :desc)
    @sizes = Size.all
  end


  def edit
    @size = Size.all
  end

  def update

    if @dog.update(dog_params)
        flash[:success] = 'dog item updated!'
        redirect_to dog_path(@dog)
    else
        flash[:error] = 'Please see errors below!'
        render :edit
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, notice: 'dog item deleted'
  end

  private
  def find_dog
    @dog = Dog.find params[:id]
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :size_id, :description,:availability,:suburb, :postal_code, :image)
  end

  def authorize_access
    unless can? :manage, @dog
      redirect_to root_path, alert: 'You cannot edit this dog.'
     end
  end
end
