class ContentsController < ApplicationController
    def index
    end

    def new
        @content = Content.new
    end
end
