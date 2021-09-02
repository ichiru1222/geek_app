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

    def show
        @content = Content.find(params[:id])
    end

    def edit
        @content = Content.find(params[:id])
    end

    def update
        content = Content.find(params[:id])
        if content.update(content_params)
            redirect_to :action => "show", :id => content.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        content = Content.find(params[:id])
        content.destroy
        redirect_to action: :index
    end

    private
    def content_params
        params.require(:content).permit(:title, :artist, :video, :comment)
    end
end
