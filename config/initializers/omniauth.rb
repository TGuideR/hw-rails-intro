Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2,  "136163743922-1pe1f3t0nn2v9i9so16g4afk05t9lnqb.apps.googleusercontent.com",  
    "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",
    scope: 'email, profile'
end
OmniAuth.config.allowed_request_methods = %i[get]

