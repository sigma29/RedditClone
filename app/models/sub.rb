class Sub < ActiveRecord::Base
  validates :moderator_id, :title, :description, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
    class_name: "User",
    foreign_key: :moderator_id
end