class Comment < ApplicationRecord
belongs_to :user, class_name: "User"
belongs_to :suggestion

validates :body, :user, :suggestion, :thumbs_up, presence: true
end
