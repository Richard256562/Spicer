class TasksController < ApplicationController
    def index
        render json: Task.all, status: :ok
    end

       #GET/tasks/{id}
       def show
        #check whether the task exists
        task =Task.find_by(id: params[id])
        if task
            render json: task, status: :ok
        else
            render json: {error: "Task not found"}, status: :not_found
        end
    
        #POST/Tasks
        def create
            task = Task.create(task_params)
            #check whethet task is valid
            if task.valid?
                render json: task, status::accepted
            else 
                render json: {error:"An error occurred.Please try again"}, status: :unprocessable entity
            end
        end
    # PUT/PATCH
    def update 
        task =Task.find_by(id: params[id])
        if task
            task.update(task_params)
            #return it
            render json: task, status::accepted
        else
            #throw not found error
            render json: {error: "Task not found"}, status: :not_found
        end

    end
    #DELETE
    def destroy
        #check if task exists
        task =Task.find_by(id: params[id])
        #delete task
        if task
            task.destroy
            head :no_content
        #return a not found error
        else
            render json: {error: "Task not found"}, status: :not_found
        end 
     end

     private
     def task_params
        params.permit(
            :task_name, :task_description, :task_status, :user_id
        )
     end




end
