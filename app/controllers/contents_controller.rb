class ContentsController < ApplicationController
    def index
        @contents = Content.all
    end

    def new
        @content = Content.new
    end

    def create
        content = Content.new(content_params)
        content.user_id = current_user.id
        if content.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end


    private
    def content_params
        params.require(:content).permit(:title, :artist, :video, :comment)
    end
end
