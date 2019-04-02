Fabricator(:user) do
  username "lserman"
#  encrypted_password: User.new.send(:password_digest, 'password')
  #email "logan.serman#{Kernel.rand(100000000)}@metova.com"
  email { Faker::Internet.email }
  #authentication_token 123456
  #token_expires_at Time.now.tomorrow

  password { 'password' }
end