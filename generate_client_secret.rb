# Source: https://developer.okta.com/blog/2019/06/04/what-the-heck-is-sign-in-with-apple
require 'jwt'
# Update these values with your app's information
team_id = 'Maxwell Dumonde'
client_id = 'com.example.meshMsgr'
key_id = '9UN3K6ST7V'
key_file = './AuthKey_9UN3K6ST7V.p8'
aud = 'https://appleid.apple.com'
exp = Time.now.to_i + 86400*180

if !File.file?(key_file)
  puts "Valid *.p8 file is required"
  exit 1
end

# Define the JWT's headers and claims
headers = {
  # The token must be signed with your key
  'kid' => key_id
}
claims = {
  # The token is issued by your Apple team
  'iss' => team_id,
  # The token applies to Apple ID authentication
  'aud' => aud,
  # The token is scoped to your application
  'sub' => client_id,
  # The token is valid immediately
  'iat' => Time.now.to_i,
  # The token expires in 6 months (maximum allowed)
  'exp' => exp
}
# Read in the key and generate the JWT
ecdsa_key = OpenSSL::PKey::EC.new IO.read key_file
token = JWT.encode claims, ecdsa_key, 'ES256', headers
# Print the JWT to stdout
puts token