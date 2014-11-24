class PagesController < ApplicationController
  def home
  end

  def about
  end

  def tunes
  end

  def photographs
  end

  def dates
  end

  def delete_posts
    if !current_user.admin?
      redirect_to home_path
      return
    end
    p = Post.find(params[:id])
    p.destroy

    redirect_to home_path
  end
end
