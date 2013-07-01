class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json

  load_and_authorize_resource

  def index

      @todos = Project.find(params[:project_id]).todos
      @open = @todos.where(:status=> false)
      @closed = @todos.where(:status=> true)
      if current_user
        @project = Project.find(params[:project_id])
        @todo = @project.todos.build
      end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @project = Project.find(params[:project_id])
    @todo = current_user.projects.find(@project).todos.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])
    @todos = Project.find(params[:project_id]).todos
    @todo.user_id = current_user.id
    @todo.status = false
    @todo.project_id = params[:project_id]
    respond_to do |format|
      if @todo.save
        format.html { redirect_to project_todos_path(:project_id=>params[:project_id]), notice: 'To-do was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        @todo = @todo
        @open = @todos.where(:status=> false)
        @closed = @todos.where(:status=> true)
        format.html { render action: "index", alert: 'To-do was not created.'}
        format.json { render json: @todo, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        if !params[:todo][:project_id].blank?
          format.html { redirect_to project_todos_path(:project_id => params[:todo][:project_id]), notice: 'Todo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to project_todos_url(@todo.project) }
      format.json { head :no_content }
    end
  end


  def toggle
    @todo = Todo.find(params[:todo_id])
    result = @todo.status == true ? false : true
    respond_to do |format|
      if @todo.update_attribute(:status, result)
        format.json { render :nothing => true }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
end
