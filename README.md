<div style="text-align:center"><img src="https://raw.githubusercontent.com/azutoolkit/authority/main/logo.png" /></div>

# authority

OpenID Connect and OAuth Provider written in Crystal - Security-first, open
source API security for your infrastructure. SDKs to come.

Authority is a OpenID OAuth 2.0 Server and OpenID Connect Provider optimized for
low-latency, high throughput, and low resource consumption. Authority has a built
in identity provider user login.

Implementing and using OAuth2 without understanding the whole specification is
challenging and prone to errors, even when SDKs are being used. The primary goal
of Authority is to make OAuth 2.0 and OpenID Connect 1.0 better accessible.

## Installation

TODO: Write installation instructions here

## Usage

TODO: Write usage instructions here

## Features Missing

Token Information Endpoint

```bash
POST /token_info HTTP/1.1
Host: authorization-server.com
Authorization: Basic Y4NmE4MzFhZGFkNzU2YWRhN

token=c1MGYwNDJiYmYxNDFkZjVkOGI0MSAgLQ
```

```bash
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "active": true,
  "scope": "read write email",
  "client_id": "J8NFmU4tJVgDxKaJFmXTWvaHO",
  "username": "aaronpk",
  "exp": 1437275311
}
```

ID Tokens

```bash
{
  "iss": "https://server.example.com",
  "sub": "24400320",
  "aud": "s6BhdRkqt3",
  "nonce": "n-0S6_WzA2Mj",
  "exp": 1311281970,
  "iat": 1311280970,
  "auth_time": 1311280969,
  "acr": "urn:mace:incommon:iap:silver"
}
```

User Registration

Client Registration

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/authority/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Elias Perez](https://github.com/your-github-user) - creator and maintainer
