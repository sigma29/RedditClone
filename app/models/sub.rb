class Sub < ActiveRecord::Base
  validate :moderator_id, :title, :description, presence: true
  validate :title, uniqueness: true

  belongs_to :moderater,
    class_name: "User",
    foreign_key: :moderator_id
end
