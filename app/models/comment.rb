class Comment < ApplicationRecord
  belongs_to :post
  validates :post,       presence: true
  validates :commenter,  presence: true
  validates :body,       presence: true
end
