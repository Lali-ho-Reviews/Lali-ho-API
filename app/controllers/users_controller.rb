class UsersController < ApplicationController


    def create
        @user = User.new(user_params)
        @user.isAdmin = false

        if @user.save
            print @user
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {username: @user.username, jwt: auth_token.token }, status: :created #, location: @message
        else
            # render json: @user.errors, status: :unprocessable_entity
            print @user.errors.attribute_names
            # render json: {error: "Invalid signup"}
            render json: {error: @user.errors}
        end
    end

    private

    # Only allow a list of trusted parameters through.
    def user_params
        params.permit(:username, :email, :user, :password, :password_confirmation)
    end
end
