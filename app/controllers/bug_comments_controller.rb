class BugCommentsController < ApplicationController
  # GET /bug_comments
  # GET /bug_comments.json
  def index
    @bug_comments = BugComment.where(:bug_post_id=>params[:bug_post_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bug_comments }
    end
  end

  # GET /bug_comments/1
  # GET /bug_comments/1.json
  def show
    @bug_comment = BugComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug_comment }
    end
  end

  # GET /bug_comments/new
  # GET /bug_comments/new.json
  def new
    @bug_comment = BugComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug_comment }
    end
  end

  # GET /bug_comments/1/edit
  def edit
    @bug_comment = BugComment.find(params[:id])
  end

  # POST /bug_comments
  # POST /bug_comments.json
  def create
    @bug_comment = BugComment.new(params[:bug_comment])

    respond_to do |format|
      if @bug_comment.save
        format.html { redirect_to project_bug_list_bug_post_path(params[:project_id], params[:bug_list_id], params[:bug_post_id]), notice: 'Bug comment was successfully created.' }
        format.json { render json: @bug_comment, status: :created, location: @bug_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @bug_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bug_comments/1
  # PUT /bug_comments/1.json
  def update
    @bug_comment = BugComment.find(params[:id])

    respond_to do |format|
      if @bug_comment.update_attributes(params[:bug_comment])
        format.html { redirect_to project_bug_list_bug_post_path(params[:project_id], params[:bug_list_id], params[:bug_post_id]), notice: 'Bug comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_comments/1
  # DELETE /bug_comments/1.json
  def destroy
    @bug_comment = BugComment.find(params[:id])
    @bug_comment.destroy

    respond_to do |format|
      format.html { redirect_to project_bug_list_bug_post_path(params[:project_id], params[:bug_list_id], params[:bug_post_id]), notice: 'Bug comment was deleted.' }
      format.json { head :ok }
    end
  end
end
