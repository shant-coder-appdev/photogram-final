class UsersController < ApplicationController
  def new_registration_form
    #@users = User.all.order({ :username => :asc })

    render({ :template => "users/sign_up_form.html" })
  end

  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html" })
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/show.html.erb" })
  end

  def liked_photos
    the_username = params.fetch("the_username")
    user_id = User.where({ :username => the_username }).at(0)
    @user_id = Like.where({ :id => user_id }).at(0)

    render({ :template => "users/liked_photos.html.erb" })
  end

  def create
    user = User.new

    user.username = params.fetch("input_username")

    save_status = user.save

    redirect_to("/users/#{user.username}")
  end

  def update
    the_id = params.fetch("the_user_id")
    user = User.where({ :id => the_id }).at(0)

    user.username = params.fetch("input_username")

    user.save

    redirect_to("/users/#{user.username}")
  end

  def destroy
    username = params.fetch("the_username")
    user = User.where({ :username => username }).at(0)

    user.destroy

    redirect_to("/users")
  end
end
