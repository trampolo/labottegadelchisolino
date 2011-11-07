class UserSession < Authlogic::Session::Base
  login_field :username
  password_field :password
end