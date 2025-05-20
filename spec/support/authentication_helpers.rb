module AuthenticationHelpers
  def sign_in_user(user = create(:user))
    sign_in user, scope: :user
  end

  def sign_out_user
    sign_out
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :request
end
