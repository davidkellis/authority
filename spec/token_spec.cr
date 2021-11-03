require "./spec_helper"

describe "TokenSpec" do
  describe "OpenID" do
    it "returns id_token" do
      user = create_owner
      scope = "openid read"
      code, code_verifier, expected_state = prepare_code_challenge_url(user.username, user.password, "S256", scope)

      response = create_token_request(code, code_verifier, scope)
      token = OAuth2::AccessToken::Bearer.from_json(response.body)
      p response.body
      id_token = token.extra.not_nil!["id_token"]
      p Authly.config.secret_key
      p id_token
      id_token.should_not be_nil
    end
  end

  describe "Refresh Token Flow" do
    it "gets access token" do
      refresh = OAUTH_CLIENT.get_access_token_using_client_credentials scope: "read"
      token = OAUTH_CLIENT.get_access_token_using_refresh_token refresh.refresh_token, scope: "read"
      token.should be_a OAuth2::AccessToken::Bearer
    end
  end

  describe "Create Token" do
    describe "Method S256" do
      it "creates access token" do
        user = create_owner
        code, code_verifier, expected_state = prepare_code_challenge_url(user.username, user.password, "S256")

        response = create_token_request(code, code_verifier)
        token = OAuth2::AccessToken::Bearer.from_json(response.body)

        response.status_message.should eq "OK"
        token.should be_a OAuth2::AccessToken::Bearer
      end
    end

    describe "Method PLAIN" do
      it "creates access token" do
        user = create_owner
        code, code_verifier, expected_state = prepare_code_challenge_url(user.username, user.password, "plain")

        response = create_token_request(code, code_verifier)
        token = OAuth2::AccessToken::Bearer.from_json(response.body)

        p token

        response.status_message.should eq "OK"
        token.should be_a OAuth2::AccessToken::Bearer
      end
    end
  end

  describe "Inspect Token" do
  end
end
