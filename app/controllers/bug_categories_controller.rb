class BugCategoriesController < ApplicationController
  # GET /bug_categories
  # GET /bug_categories.json
  def index
    @bug_categories = BugCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bug_categories }
    end
  end

  # GET /bug_categories/1
  # GET /bug_categories/1.json
  def show
    @bug_category = BugCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug_category }
    end
  end

  # GET /bug_categories/new
  # GET /bug_categories/new.json
  def new
    @bug_category = BugCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug_category }
    end
  end

  # GET /bug_categories/1/edit
  def edit
    @bug_category = BugCategory.find(params[:id])
  end

  # POST /bug_categories
  # POST /bug_categories.json
  def create
    @bug_category = BugCategory.new(params[:bug_category])

    respond_to do |format|
      if @bug_category.save
        format.html { redirect_to @bug_category, notice: 'Bug category was successfully created.' }
        format.json { render json: @bug_category, status: :created, location: @bug_category }
      else
        format.html { render action: "new" }
        format.json { render json: @bug_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bug_categories/1
  # PUT /bug_categories/1.json
  def update
    @bug_category = BugCategory.find(params[:id])

    respond_to do |format|
      if @bug_category.update_attributes(params[:bug_category])
        format.html { redirect_to @bug_category, notice: 'Bug category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_categories/1
  # DELETE /bug_categories/1.json
  def destroy
    @bug_category = BugCategory.find(params[:id])
    @bug_category.destroy

    respond_to do |format|
      format.html { redirect_to bug_categories_url }
      format.json { head :ok }
    end
  end
end
