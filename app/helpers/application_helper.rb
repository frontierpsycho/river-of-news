module ApplicationHelper
  def display_published_at(datetime)
    if datetime > Time.now.utc.beginning_of_day
      datetime.strftime("#{t(:today)} %k:%M")
    elsif datetime > 1.day.ago.utc.beginning_of_day
      datetime.strftime("#{t(:yesterday)} %k:%M")
    else
      datetime.to_s(:short)
    end
  end
end
