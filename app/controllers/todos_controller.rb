class TodosController < ApplicationController
  load_and_authorize_resource

  # POST /todos
  # POST /todos.json
  def create
    @project = Project.find(params[:project_id])
    @todo = Todo.new(params[:todo])
    @todos = @project.todos
    @todo.project_id = @project.id
    @todo.author_id = current_user.id
    respond_to do |format|
      if @todo.save
        format.js
        #format.json { render json: @todo, status: :created, location: @todo }
      else
        #@ctodo = @ctodo
        #@open = @todos.where(:status=> false)
        #@closed = @todos.where(:status=> true)
        format.js
        #format.json { render json: @todo, status: :unprocessable_entity }
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
      format.html { redirect_to project_url(@todo.project) }
      format.json { head :no_content }
    end
  end


end
