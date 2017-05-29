module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
    def find_verified_user
      verified_user = User.find_by(id: cookies.signed[:user_id])
      verified_user = User.first if verified_user.blank?
      
      if verified_user # && cookies.signed[:user_expires_at] > Time.now
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end