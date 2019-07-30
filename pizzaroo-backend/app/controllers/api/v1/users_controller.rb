class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(set_current_user) }, status: :accepted
    end

    def index
        @all = User.all
        render json: @all, each_serializer: UserSerializer
    end

    # def show
    #   user = User.find_by(id: params[:id])
    #   if user 
    #       render json: userSerializer.new(user).to_serialized_json
    #   else
    #       render json: { error: user.errors.full_messages }
    #   end
    # end
   
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), token: @token }, status: :created
      else
        render json: { error: user.errors.full_messages }, status: :not_acceptable
      end
    end

    # def update
    #   user = User.find(params[:id])
    #   user.update(attr)
    #   render json: UserSerializer.new(user).to_serialized_json
    # end

    # def destroy
    #     user = User.find_by(id: params[:id])
    #     id = user.id
    #     user.destroy
    #     render json: {info: 'user destroyed', userId: id}
    # end
   
    private
   
    def user_params
      params.require(:user).permit(:username, :password, :name)
    end
  end
