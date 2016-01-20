module ApplicationHelper

  def cache_key_for_mountain(mountain)
    mountain_name = mountain.name.parameterize
    time_stamp = Time.now.strftime("%Y-%m-%e-%H")
    [mountain_name, "data", time_stamp].join("-")
  end

  def cache_key_for(model_class, label = "")
    prefix       = model_class.to_s.downcase.pluralize
    max_updated  = model_class.maximum(:updated_at)
    count        = model_class.count

    [prefix, label, max_updated, count].join("-")
  end

end
