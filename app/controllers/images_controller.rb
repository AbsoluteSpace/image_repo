class ImagesController < ApplicationController

  before_action :verify_is_admin, :except => [:index, :show, :purchase]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    largest_discount, discount_id = largest_discount_for_image(@image)

    if largest_discount > 0
      @image.discount = true
      @image.discount_price = @image.price - largest_discount > 0 ? @image.price - largest_discount : 0
      @image.discounts = @image.discounts + discount_id.to_s 
    end

    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    temp_params = image_params

    largest_discount, discount_id = largest_discount_for_image(Image.new(image_params))

    if largest_discount > 0
      temp_params[:discount] = true
      temp_params[:discounts] = discount_id
      temp_params[:discount_price] = image_params[:price].to_d - largest_discount > 0 ? image_params[:price].to_d - largest_discount : 0 
    end
    
    if @image.update(temp_params)
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to root_path
  end

  def purchase
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:title, :body, :price, :discount_price, :discount, :file_location, :tags, :discounts)
  end

end
