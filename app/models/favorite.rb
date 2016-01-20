class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :mountain

  after_create :update_mountain

  def update_mountain
    Mountain.find(self.mountain_id).update_attributes(updated_at: Time.now)
  end
end
