class ContentsController < ApplicationController
    def index
        @contents = Content.all.page(params[:page]).per(3)
        @Top_favorite_content = Content.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first
    end

    def search
        if params[:search] != nil && params[:search] != ''
            #部分検索かつ複数検索
            search = params[:search]
            @contents = Content.joins(:user).where("title LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
          else
            @contents = Content.all.page(params[:page]).per(3)
          end
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
        @comments = @content.comments
        @comment = Comment.new
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
        params.require(:content).permit(:title, :artist, :video, :my_comment)
    end
end
