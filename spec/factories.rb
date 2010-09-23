# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.email                 "mhartl@example.com"
  user.name                  "Michael Hartl"
  user.user_role_id           1
  user.password              "foobar"
  user.password_confirmation "foobar"
end