class Discount < ApplicationRecord
    validates :discount_type, inclusion: { in: [ true, false ] }
    validates :amount_discount, presence: true
    validates :percentage_discount, presence: true
    validates :all_tags, inclusion: { in: [ true, false ] }
    validates :active, inclusion: { in: [ true, false ] }
end
