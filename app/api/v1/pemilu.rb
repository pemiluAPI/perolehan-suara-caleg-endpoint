module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :caleg do
      desc "Return list of voice acquisition candidates"
      get do
        results = Caleg.apiall(params)
        {
          results: results
        }
      end
    end
  end
end