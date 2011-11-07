class RightsController < ApplicationController
  # GET /rights
  # GET /rights.json
  def index
    @rights = Right.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rights }
    end
  end

  # GET /rights/1
  # GET /rights/1.json
  def show
    @right = Right.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @right }
    end
  end

  # GET /rights/new
  # GET /rights/new.json
  def new
    @right = Right.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @right }
    end
  end

  # GET /rights/1/edit
  def edit
    @right = Right.find(params[:id])
  end

  # POST /rights
  # POST /rights.json
  def create
    @right = Right.new(params[:right])

    respond_to do |format|
      if @right.save
        format.html { redirect_to @right, notice: 'Right was successfully created.' }
        format.json { render json: @right, status: :created, location: @right }
      else
        format.html { render action: "new" }
        format.json { render json: @right.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rights/1
  # PUT /rights/1.json
  def update
    @right = Right.find(params[:id])

    respond_to do |format|
      if @right.update_attributes(params[:right])
        format.html { redirect_to @right, notice: 'Right was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @right.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rights/1
  # DELETE /rights/1.json
  def destroy
    @right = Right.find(params[:id])
    @right.destroy

    respond_to do |format|
      format.html { redirect_to rights_url }
      format.json { head :ok }
    end
  end
end
