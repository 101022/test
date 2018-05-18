class CommentsController < ApplicationController
    def new

    end

    def create
        comment = post.comments.new(comment_params)
        if comment.save
            redirect_to post_path(post), flash: {success: 'コメントを登録しました。'}
        else
            redirect_to post_path(post), flash: {error: 'コメント登録に失敗しました。'}
        end
    end

    def edit
        @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    end

    def update
        @comment = comment
        if @comment.update(comment_params)
            redirect_to post_path(@comment.post), flash: {success: 'コメントを更新しました。'}
        else
            redirect_to post_path(@comment.post), flash: {error: 'コメント更新に失敗しました。'}
        end
    end

    def destroy
        @post = post
        @comment = @post.comments.find(params[:id])
        if @comment.destroy
            redirect_to post_path(@post), flash: {success: 'コメントを削除しました。'}
        else
            redirect_to post_path(@post), flash: {error: 'コメントを削除できませんでした。'}
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end

        def post
            @post ||= Post.find(params[:post_id])
        end

        def comment
            @comment ||= Comment.find(params[:id])
        end
end
