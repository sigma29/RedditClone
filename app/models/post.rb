class Post < ActiveRecord::Base
  validates :title, :author, :post_subs, presence: true

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :posts

  has_many :post_subs,
    dependent: :destroy

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments,
    dependent: :destroy

  def comments_by_parent_id
    comments_hash = {}
    comments.includes(:author).each do |comment|
      if comments_hash.has_key?(comment.parent_comment_id)
        comments_hash[parent_comment_id] << comment
      else
        comments_hash[parent_comment_id] = [comment]
      end
    end
  end

end
