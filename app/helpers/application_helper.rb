module ApplicationHelper
  def display_published_at(datetime)
    if datetime > Time.now.beginning_of_day
      datetime.strftime("#{t(:today)} %k:%M")
    elsif datetime > 1.day.ago.beginning_of_day
      datetime.strftime("#{t(:yesterday)} %k:%M")
    else
      datetime.to_s(:short)
    end
  end
end
