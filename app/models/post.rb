class Post < ApplicationRecord
    validates :name,  presence: true
    validates :title, presence: true
    has_many  :comments, class_name: "Comment", dependent: :destroy
end
