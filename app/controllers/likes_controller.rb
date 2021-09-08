class LikesController < ApplicationController
    def create
        like = current_user.likes.create(content_id: params[:content_id]) #user_idとcontent_idの二つを代入
        redirect_back(fallback_location: root_path)
    end

    def destroy
        like = Like.find_by(content_id: params[:content_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end
end
