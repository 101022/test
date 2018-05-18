class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, flash: {success: '日記を投稿しました。'}
    else
      render :new, flash: {error: '日記を投稿できませんでした。'}
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if post.update(post_params)
      redirect_to post, flash: {success: '日記を更新しました。'}
    else
      render :edit, flash: {error: '日記を更新できませんでした。'}
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if post.destroy
      redirect_to posts_url, flash: {success: '日記を削除しました。'}
    else
      redirect_to posts_url, flash: {error: '日記を削除できませんでした。'}
    end
  end

  private
    def post
      @post ||= Post.find(params[:id])
    end
    
    helper_method :post

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
