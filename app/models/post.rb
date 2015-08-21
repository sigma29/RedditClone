class Post < ActiveRecord::Base
  validates :title, :author, :post_subs, presence: true

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :posts

  has_many :post_subs,
    dependent: :destroy


end
