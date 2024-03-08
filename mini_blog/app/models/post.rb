class Post < ApplicationRecord
  validates :title, :description, presence:true
  validates :title, length: {minimum:5}
  validates :description, length: {minimum:15}

#   #jeito finalizado na aula
#   before_save do
#     self.title = self.title + "Leonardo"
#   end
# end

  before_save do
    last_post_id = Post.last&.id || 0
    self.title = "#{self.title} - Leonardo's Post #{last_post_id + 1}"
  end
end


#   before_save do
#     if self.post_id.present? && Post.exists?(self.post_id)
#       idpost = Post.find(self.post_id)
#       self.title = "#{self.title} - Leonardo's Post #{idpost.id}"
#     end
#   end
# end