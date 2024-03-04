module AdminAuthenticable
    def current_admin
      return @current_admin if @current_admin

      begin
        token = extract_token_from_request
        @current_admin ||= find_current_admin_by_token(token)
        @current_admin
      rescue => ex
        puts "ERROR: #{ex.inspect}"
        nil
      end
    end

    private

    def extract_token_from_request
      token = request.headers["Authorization"]&.split&.last
      raise JWT::DecodeError, "Invalid Credentials" unless token
      token
    end

    def find_current_admin_by_token(token)
        decoded_token = JsonWebToken.decode(token)
        Admin.find(decoded_token[:admin_id])
    end
end
