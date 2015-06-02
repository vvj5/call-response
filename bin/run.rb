require_relative '../db/setup'
require_relative '../lib/user.rb'
# Remember to put the requires here for all the classes you write and want to use

def parse_params(uri_fragments, query_param_string)
  params = {}
  params[:resource]  = uri_fragments[3]
  params[:id]        = uri_fragments[4]
  params[:action]    = uri_fragments[5]
  if query_param_string
    param_pairs = query_param_string.split('&')
    param_k_v   = param_pairs.map { |param_pair| param_pair.split('=') }
    param_k_v.each do |k, v|
      params.store(k.to_sym, v)
    end
  end
  params
end

def parse(raw_request)
  pieces = raw_request.split(' ')
  method = pieces[0]
  uri    = pieces[1]
  http_v = pieces[2]
  route, query_param_string = uri.split('?')
  uri_fragments = route.split('/')
  protocol = uri_fragments[0][0..-2]
  full_url = uri_fragments[2]
  subdomain, domain_name, tld = full_url.split('.')
  params = parse_params(uri_fragments, query_param_string)
  return {
    method: method,
    uri: uri,
    http_version: http_v,
    protocol: protocol,
    subdomain: subdomain,
    domain_name: domain_name,
    tld: tld,
    full_url: full_url,
    params: params
  }
end

system('clear')
loop do
  print "Supply a valid HTTP Request URL (h for help, q to quit) > "
  raw_request = gets.chomp

  case raw_request
  when 'q' then puts "Goodbye!"; exit
  when 'h'
    puts "A valid HTTP Request looks like:"
    puts "\t'GET http://localhost:3000/students HTTP/1.1'"
    puts "Read more at : http://www.w3.org/Protocols/rfc2616/rfc2616-sec5.html"
  else
    REQUEST = parse(raw_request)
    PARAMS  = REQUEST[:params]
    # Use the REQUEST and PARAMS constants to full the request and
    # return an appropriate reponse

#     # YOUR CODE GOES BELOW HERE

# puts PARAMS

    # if PARAMS[:id] != nil
    #   if User.find(PARAMS[:id]) != true
    #       puts "*** NOT FOUND - HTTP ERROR 204 ***"
    #   end

#    def print_user_name(user)
#   return if user.name.nil?
#   puts user.name

    # @user = User(PARAMS[:id]).exists?
    #   if @user == false
    #   puts "*** NOT FOUND - HTTP ERROR 204 ***"
    #   end
    # end

    if PARAMS[:id] != nil
      @user = User.find(PARAMS[:id])
      puts "*** HTTP REQUEST SUCCESSFUL - CODE 200 ***\n   #{@user.first_name} #{@user.last_name} #{@user.age}  "
    elsif PARAMS[:resource] == "users"
      @users = User.all
      @users.each do |user|
      puts "   #{user.first_name} #{user.last_name} #{user.age}  "
    end
  end

# Given this request GET http://localhost:3000/users HTTP/1.1 I should see
# ALL the users from the database printed out to me with an appropriate response code.

# Given this request GET http://localhost:3000/users/1 HTTP/1.1
# I should see ONLY the user from the database with that id.

# Given this request GET http://localhost:3000/users/9999999 HTTP/1.1
# I should see a message saying it was not found and the appropriate response code returned to me.

    # YOUR CODE GOES ABOVE HERE  ^
  end
end
