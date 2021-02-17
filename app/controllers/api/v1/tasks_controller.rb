module Api::V1
  class TasksController < ApiController
    def index
      @task = current_user.tasks
      p @task
      render json: @task
    end

    def show
      @task = Task.find(params[:id])
      render json: @task
    end

    def create
      @task = current_user.tasks.create(task_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
    end
    ###############################################################
    private

    def task_params
      params
        .require(:task)
        .permit(:title, :description, :dueDate, :priority,:done)
    end
    #
  end
end