module Api::V1
  class TasksController < ApplicationController

    def index
      @task = Task.all
      render json: @task
    end

    def show
      @task = Task.find(params[:id])
      render json: @task
    end

    def create
      @task = Task.new(task_params)
      @task.done=false;
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
        .permit(:title, :description, :dueDate, :priority)
    end

  end
end