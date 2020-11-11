class FlatsController < ApplicationController
  before_action :get_instance_from_id, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @search = params[:search]
      @flats = Flat.where("name LIKE '%#{@search}%'")
      @presentation = "You searched for \"#{@search}.We found #{@flats.count} flat(s) out of #{Flat.all.count} our on our website"
    else
      @flats = Flat.all
      @presentation = "All #{@flats.count} flats"
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(required_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(required_params)
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def get_instance_from_id
    @flat = Flat.find(params[:id])
  end

  def required_params
    params.require(:flat).permit(:name, :address, :price_per_night, :number_of_guests, :picture_url)
  end
end
