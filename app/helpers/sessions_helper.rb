module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_me] = [user.id, user.salt]
    current_user = user
  end
  
  def sign_out
    cookies.delete(:remember_me)
    self.current_user = nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_cookie
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  private
  
    def user_from_cookie
      User.authenticate_with_salt(*remember_me)
    end
    
    def remember_me
      cookies.signed[:remember_me] || [nil, nil]
    end
end
