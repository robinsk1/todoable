class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  load_and_authorize_resource

  def cities
    #@projects = Project.all.reject {|n|!n.try :location}
    counts = Project.joins(:location).count(:group=>:city)
    @projects = []
    counts.each do |k,v|
      projects_with_location = Project.joins(:location).where("locations.city = '#{k}'").joins(:pictures).first
      proj = !projects_with_location.nil? ? projects_with_location.id : "nil"
      new_hash = {:city => k, :list_count => v, :proj_id => proj }
      @projects << (new_hash)
    end
    @projects
    #projs = Project.joins(:location).all
    #projs.group_by {|p| p.location.city}
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

  def owner
     @projects = current_user.projects.all
     respond_to do |format|
      format.html {render :action => :index}
      format.json { render json: @projects }
     end
  end


  def index
    if params[:id]
      @projects = User.find(params[:id]).projects.all
    else
      @projects = Project.all
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = current_user.projects.build
    @photo = @project.pictures.build
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
        format.html { redirect_to project_todos_path(@project) }
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


  def join
    @participation = current_user.participations.build(:project_id => params[:id])
       respond_to do |format|
         if @participation.save
           format.json { render :nothing => true }
         else
           format.json { render json: @participation.errors, status: :unprocessable_entity }
         end
       end
  end


  def leave
    @participation = current_user.participations.find_by_project_id(params[:id])
    @participation.destroy
       respond_to do |format|
         format.json { render :nothing => true }
       end

    end

end
