class Comment < ApplicationRecord

  validates :body, presence: true, length: { minimum: 5}
  belongs_to :post
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_comment_id, dependent: :destroy
  

end
