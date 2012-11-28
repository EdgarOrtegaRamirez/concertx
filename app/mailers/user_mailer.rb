class UserMailer < ActionMailer::Base
  default from: 'noreply@localhost'

  def new_event(event, current_user)
    @event = event
    Follower.following(current_user.id).each do |follower|
      
      mail(to: follower.follower.email, subject: "#{event.user.name} published a new event!")

    end
  end

end
