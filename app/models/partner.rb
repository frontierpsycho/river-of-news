class Partner < ActiveRecord::Base
  attr_accessible :name, :url

  def get_latest
    if self.last_fetched.nil?
      self.url
    else
      self.url + "?start_at=#{URI.escape(self.last_fetched.strftime('%Y-%m-%d %H:%M'))}"
    end
  end
end
