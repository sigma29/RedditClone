class Sub < ActiveRecord::Base
  validates :moderator_id, :title, :description, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    inverse_of: :subs

  has_many :post_subs,
    inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post

end
