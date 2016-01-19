module ApplicationHelper

  def cache_key_for_mountain(mountain)
    mountain_name = mountain.name.parameterize
    time_stamp = Time.now.strftime("%Y-%m-%e-%H")
    [mountain_name, "data", time_stamp].join("-")
  end

  def cache_key_for_page(page_name, user_id)
    if user_id.nil?
      last_updated = "unregistered-user"
    else
      last_updated = User.find(user_id).favorites.maximum(:updated_at).to_s.parameterize
    end
    time_stamp = Time.now.strftime("%Y-%m")
    name = page_name.parameterize
    [page_name, last_updated, user_id, time_stamp].join("-")
  end

end
