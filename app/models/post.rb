class Post < ActiveRecord::Base
  validates :title, :author, :sub, presence: true

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :posts

  belongs_to :sub,
    inverse_of: :posts

  has_many :post_subs

end
