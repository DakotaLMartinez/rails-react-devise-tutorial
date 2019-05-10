module Api 
  module V1
    class PostsController < ApplicationController
      def index 
        if user_signed_in?
          render json: current_user.posts
        else
          render json: {}, status: 401
        end 
      end

      def create 
        if user_signed_in? 
          if post = current_user.posts.create(post_params)
            render json: post, status: :created 
          else 
            render json: post.errors, status: 400
          end
        else 
          render json: {}, status: 401
        end
      end

      private 

      def post_params 
        params.require(:post).permit(:title, :content)
      end
    end
  end 
end

