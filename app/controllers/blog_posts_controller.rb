class BlogPostsController < ApplicationController
 
  http_basic_authenticate_with name: "ddh", password: "secret", except: [:index, :show]

  def new
  	@blog = BlogPost.new
  end

  def create
  		@blog = BlogPost.new(blog_post_params)
  	
			if @blog.save
  		  redirect_to @blog
      else
        render 'new'
      end
  end

  def edit
   @blog = BlogPost.find(params[:id])
  end

  def update
    @blog = BlogPost.find(params[:id])

    if @blog.update(blog_post_params)
      redirect_to @blog
    else 
      render 'edit'
    end
  end

  def show
  	@blog = BlogPost.find(params[:id])
  end

  def index
    @allblogposts = BlogPost.all
  end
  
  def destroy
    @blog = BlogPost.find(params[:id])
    @blog.destroy
 
    redirect_to blog_index_path
  end

	private
	def blog_post_params
		params.require(:blog_post).permit(:description)
	end

end
