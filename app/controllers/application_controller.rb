class ApplicationController < ActionController::Base

    protected 

    def largest_discount_for_image(image, refresh_discount = false)
        largest_discount = image.discount ? image.price - image.discount_price : 0
        largest_discount = 0 if refresh_discount
        discount_id = 0
        Discount.find_each do |discount|
            unless discount.active
                next
            end

            if discount.all_tags
                discount_amount = calculate_discount(discount, image)
                largest_discount = discount_amount > largest_discount ? discount_amount : largest_discount
                next
            end

            if image.tags.nil?
                next
            end

            if (split_tags(discount.tags) & split_tags(image.tags)).empty?
                next
            end

            discount_amount = calculate_discount(discount, image)
            if discount_amount > largest_discount
                largest_discount = discount_amount
                discount_id = discount.id
            end
        end
        return largest_discount, discount_id
    end

    def calculate_discount(discount, image)
        if discount.discount_type
            return (discount.percentage_discount / 100)*image.price
        else
            return discount.amount_discount
        end
    end

    def verify_is_admin
        (current_user.nil?) ? redirect_back(fallback_location: "/") : (redirect_back(fallback_location: "/") unless current_user.admin?)
    end

    def split_tags(tags)
        tags.split(",").map!{|s| s.tr("[\"] ", "")}
    end

end
