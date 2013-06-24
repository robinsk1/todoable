class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json

  load_and_authorize_resource

  def index

    if params[:project_id].blank?
      @todos = Todo.all
      @open = Todo.open
      @closed = Todo.closed
    else
      @todos = Project.find(params[:project_id]).todos
      @open = @todos.where(:status=> false)
      @closed = @todos.where(:status=> true)
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
    if params[:project_id].blank?
    @todo = Todo.new
    else
    @project = Project.find(params[:project_id])
    @todo = @project.todos.build
    end
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
    respond_to do |format|
      if @todo.save
        if !params[:todo][:project_id].blank?
          format.html { redirect_to project_todos_path(:project_id=>params[:todo][:project_id]), notice: 'Todo was successfully created.' }
        else
          format.html { redirect_to :action => :index, notice: 'Todo was successfully created.' }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
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
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end
end
