class BugListsController < ApplicationController
  # GET /bug_lists
  # GET /bug_lists.json
  def index
    @bug_lists = BugList.where(:project_id=>params[:project_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bug_lists }
    end
  end

  # GET /bug_lists/1
  # GET /bug_lists/1.json
  def show
    @bug_list = BugList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug_list }
    end
  end

  # GET /bug_lists/new
  # GET /bug_lists/new.json
  def new
    @bug_list = BugList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug_list }
    end
  end

  # GET /bug_lists/1/edit
  def edit
    @bug_list = BugList.find(params[:id])
  end

  # POST /bug_lists
  # POST /bug_lists.json
  def create
    @bug_list = BugList.new(params[:bug_list])
		@bug_list.user_id = session[:user_id]
    respond_to do |format|
      if @bug_list.save
        format.html { redirect_to @bug_list.project, notice: 'Bug list was successfully created.' }
        format.json { render json: @bug_list, status: :created, location: @bug_list }
      else
        format.html { render action: "new" }
        format.json { render json: @bug_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bug_lists/1
  # PUT /bug_lists/1.json
  def update
    @bug_list = BugList.find(params[:id])
		@bug_list.user_id = session[:user_id]
    respond_to do |format|
      if @bug_list.update_attributes(params[:bug_list])
        format.html { redirect_to @bug_list.project, notice: 'Bug list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug_list.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /bug_lists/1
  # DELETE /bug_lists/1.json
  def destroy
    @bug_list = BugList.find(params[:id])
    @bug_list.destroy

    respond_to do |format|
      format.html { redirect_to project_bug_lists_url }
      format.json { head :ok }
    end
  end
end
