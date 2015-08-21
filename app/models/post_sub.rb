class PostSub < ActiveRecord::Base
  validates :sub_id, :post, presence: true
  validates :post_id, uniqueness: {scope: :sub_id}

  belongs_to :post

  belongs_to :sub,
    inverse_of: :post_subs


end
