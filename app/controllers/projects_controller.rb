  class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  load_and_authorize_resource

  def cities
    counts = Project.joins(:location).count(:group=>:city)
    @projects = []
    counts.each do |k,v|
      projects_with_location = Project.joins(:location).where("locations.city = '#{k}'").joins(:picture).first
      proj = !projects_with_location.nil? ? projects_with_location.id : "nil"
      new_hash = {:city => k, :list_count => v, :proj_id => proj }
      @projects << (new_hash)
    end
      respond_to do |format|
       format.html
       format.json { render json: @projects }
      end
  end

  def joined
    @projects = current_user.joinups.map {|n| n.project}
    respond_to do |format|
     format.html {render :action => :index}
     format.json { render json: @projects }
    end
  end



  def index
    if params[:user_id]
      @projects = User.find(params[:user_id]).projects.all
    elsif params[:city]
      @location = params[:city]
      @projects = Project.joins(:location).where(["locations.city = ?", params[:city]])
    elsif params[:search]
      @projects = Project.search(params[:search])
    elsif params[:tag]
      @projects = Project.tagged_with(params[:tag])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
     @project = Project.find(params[:id])
     @closed = Project.find(@project).todos.joins(:completes).where("completes.user_id" => current_user)
     @open = Project.find(@project).todos
     group_ids = @closed.map(&:id)
     @open = Project.find(@project).todos.where(['id not in (?)', group_ids]) unless group_ids.empty?
     @open.all
     @closed.all

     @total = Project.find(@project).todos.size
     @complete = @closed.size

     if current_user
       @todo = @project.todos.build
     end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = current_user.projects.build
    @photo = @project.build_picture
    @city = @project.build_location
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project) }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

end
