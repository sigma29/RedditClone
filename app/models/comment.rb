class Comment < ActiveRecord::Base
  validates :content, :author_id, :post_id, presence: true

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id

  belongs_to :post


end
