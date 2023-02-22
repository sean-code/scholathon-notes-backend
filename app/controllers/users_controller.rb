class UsersController < ApplicationController
    def index
        @users=User.all
        render json: @users, except:[:password, :created_at, :updated_at], status: :ok
    end

    def show
        user = User.find(session[:user_id])

        if user
            render json: user, status: :found
        else
            render json: { error: "Not authorized" }, status: :unauthorized 
        end
    end
end
