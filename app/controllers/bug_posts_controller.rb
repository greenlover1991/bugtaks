class BugPostsController < ApplicationController
  # GET /bug_posts
  # GET /bug_posts.json
  def index
    @bug_posts = BugPost.where(:bug_list_id=>params[:bug_list_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bug_posts }
    end
  end

  # GET /bug_posts/1
  # GET /bug_posts/1.json
  def show
    @bug_post = BugPost.find(params[:id])
    @bug_comment = BugComment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug_post }
    end
  end

  # GET /bug_posts/new
  # GET /bug_posts/new.json
  def new
    @bug_post = BugPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug_post }
    end
  end

  # GET /bug_posts/1/edit
  def edit
    @bug_post = BugPost.find(params[:id])
  end

  # POST /bug_posts
  # POST /bug_posts.json
  def create
    @bug_post = BugPost.new(params[:bug_post])

    respond_to do |format|
      if @bug_post.save
        format.html { redirect_to [@bug_post.bug_list.project, @bug_post.bug_list, @bug_post], notice: 'Bug post was successfully created.' }
        format.json { render json: @bug_post, status: :created, location: @bug_post }
      else
        format.html { render action: "new" }
        format.json { render json: @bug_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bug_posts/1
  # PUT /bug_posts/1.json
  def update
    @bug_post = BugPost.find(params[:id])
    respond_to do |format|
      if @bug_post.update_attributes(params[:bug_post])
        format.html { redirect_to [@bug_post.bug_list.project, @bug_post.bug_list, @bug_post], notice: 'Bug post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_posts/1
  # DELETE /bug_posts/1.json
  def destroy
    @bug_post = BugPost.find(params[:id])
    @bug_post.destroy

    respond_to do |format|
      format.html { redirect_to project_path(params[:project_id]) }
      format.json { head :ok }
    end
  end
end
