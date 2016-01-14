module ApplicationHelper

  def cache_key_for_mountain(mountain)
    mountain_name = mountain.name.parameterize
    time_stamp = Time.now.strftime("%Y-%m-%e-%H")
    [mountain_name, "data", time_stamp].join("-")
  end

end
