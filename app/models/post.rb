class Post < ActiveRecord::Base
  after_create :send_sms

  def send_sms
    `curl -X POST -d "notification[title]=#{self.title}" -d "notification[url]=http://edutechional-resty.herokuapp.com/posts/#{self.id}" http://edutechional-smsy.herokuapp.com/notifications`
  end
end
