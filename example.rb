# Load the dotenv gem
require 'dotenv'

# This tells dotenv to read the .env file and set the appropriate variables
Dotenv.load

if !File.exist?(".env")
  # If the .env file doesn't exist, inform the user that they should create one.

  puts "Hey there! I don't see a .env file in the current directory."
  puts ""
  puts "Nothing will break if the .env file doesn't exist, but it does"
  puts "make this example fairly pointless. :)"
  puts ""
  puts "We included an example .env file, though.  Run this to use it:"
  puts ""
  puts "  cp env.example .env"
  puts ""
  puts "This will copy the \"env.example\" file to the \".env\" file."
  puts "Once you've done that, run \"ruby #{$0}\" again."

  # Exit the program entirely
  exit
end

puts "Here are all your current environment variables:"

# This prints out the names and values of all the environment variables
ENV.each do |var, value|
  puts "#{var}=#{value}"
end

# Remember, ENV is a hash, so it looks like:
# {'SOME_ENVIRONMENT_VARIABLE' => 'some value', 'VARIABLE2' => 'whatever', ...}
#
# In the ENV hash, the keys correspond to the names of the environment variables
# and the values correspond to the values of those environment variables.
