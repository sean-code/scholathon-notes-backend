class UsersController < ApplicationController
    def index
        @users=User.all
        render json: @users, except:[:created_at, :updated_at], status: :ok
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render json: @user, except: [:created_at, :updated_at], status: :ok
        else
            render json: {error: "User Not Found"}, status: :not_found
        end
    end
end
