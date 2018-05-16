class CommentsController < ApplicationController
    def new

    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if (@comment.save)
            redirect_to post_path(@post), notice: 'コメントを登録しました。'
        else
            redirect_to post_path(@post), notice: 'コメント登録に失敗しました。'
        end
    end

    def edit
        @comment = Post.find(params[:post_id]).comments.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to post_path(@comment.post), notice: 'コメントを更新しました。'
        else
            redirect_to post_path(@comment.post), notice: 'コメント更新に失敗しました。'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post), notice: 'コメントを削除しました。'
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
