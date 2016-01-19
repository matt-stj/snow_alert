module ApplicationHelper

  def cache_key_for_mountain(mountain)
    mountain_name = mountain.name.parameterize
    time_stamp = Time.now.strftime("%Y-%m-%e-%H")
    [mountain_name, "data", time_stamp].join("-")
  end

  def cache_key_for_page(page_name)
    name = page_name.parameterize
    time_stamp = Time.now.strftime("%Y-%m-%e-%H")
    [name, time_stamp].join("-")
  end

end
