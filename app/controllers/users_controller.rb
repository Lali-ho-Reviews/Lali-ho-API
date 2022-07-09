class UsersController < ApplicationController

    def create
        @user = User.create(user_params)

        if @user.errors.any?
            render json: @user.errors
        else
            render json: @user, status: :created
        end
    end

    private

    # Only allow a list of trusted parameters through.
    def user_params
        params.permit(:username, :email, :rank, :password, :password_confirmation)
    end
end
