class Tweet < ActiveRecord::Base
    validates :content, presence: true
    validates :content, length: { minimum: 1 } # 値が「1文字以上」であれば有効
    validates :content, length: { maximum: 255 } # 値が「255文字以下」であらば有効
end
