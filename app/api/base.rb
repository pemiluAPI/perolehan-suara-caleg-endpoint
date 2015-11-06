require 'v1/pemilu.rb'

module Base
  class API < Grape::API
    mount Pemilu::APIv1
  end
end
