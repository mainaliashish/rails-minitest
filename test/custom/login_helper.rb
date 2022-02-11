module LoginHelper
  def log_in_as(user, password)
    post login_path, params: { email: user.email, password: password }
  end
end
