class DiscountsController < ApplicationController

    before_action :verify_is_admin

    def index
        @discounts = Discount.all
    end

    def show
        @discount = Discount.find(params[:id])
    end

    def new
        @discount = Discount.new
    end

    def create
        @discount = Discount.new(discount_params)

        if @discount.save
            update_site_discounts(@discount)
            redirect_to @discount
        else
            render :new
        end
    end

    def edit
        @discount = Discount.find(params[:id])
    end

    def update
        @discount = Discount.find(params[:id])

        if @discount.update(discount_params)
            update_site_discounts(@discount)
            redirect_to @discount
        else
            render :edit
        end
    end

    def destroy
        @discount = Discount.find(params[:id])
        @discount.update_attribute(:active, false)
        update_site_discounts(@discount)
        @discount.destroy
    
        redirect_to action: "index"
      end

    private
    def discount_params
        params.require(:discount).permit(:discount, :discount_type, :amount_discount, :percentage_discount, :tags, :all_tags, :active)
    end

    def update_site_discounts(discount)
        Image.find_each do |image|

            unless discount.active
                if image.discounts.to_i != discount.id && !discount.all_tags 
                    next
                end
                largest_discount, discount_id = largest_discount_for_image(image, true)
                new_discount_price = image.price - largest_discount > 0 ? image.price - largest_discount : 0
                new_discount_price = 0 if largest_discount == 0
                new_discount = new_discount_price == 0 ? false : true
                image.update_attribute(:discount, new_discount)
                image.update_attribute(:discounts, new_discount ? discount_id : "")
                image.update_attribute(:discount_price, new_discount_price)
                next
            end

            if discount.all_tags
                update_image_discount(discount, image) 
                next
            end

            if image.tags.nil?
                next
            end

            if (split_tags(discount.tags) & split_tags(image.tags)).empty?
                next
            end

            update_image_discount(discount, image) 
        end
    end

    def update_image_discount(discount, image) 
        discount_amount = calculate_discount(discount, image)

        unless image.discount_price.nil?
            current_discount = image.price - image.discount_price
            current_discount = 0 if image.discount_price == 0
            largest_discount = discount_amount > current_discount ? discount_amount : current_discount
        else 
            largest_discount = discount_amount
        end

        if largest_discount > 0
            image.update_attribute(:discount, true)
            image.update_attribute(:discounts, discount.id)
            image.update_attribute(:discount_price, image.price - largest_discount > 0 ? image.price - largest_discount : 0)
        end
    end
end
