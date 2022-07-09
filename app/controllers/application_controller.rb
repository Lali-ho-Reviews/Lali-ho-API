class ApplicationController < ActionController::API
    include Knock::Authenticable #all controllers gain access to knock
end
