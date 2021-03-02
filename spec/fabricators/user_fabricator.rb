Fabricator(:user) do
  email "test@gmail.com"
  password "password"
  confirmed_at Time.now
end
