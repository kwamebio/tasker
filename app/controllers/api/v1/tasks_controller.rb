class Api::V1::TasksController < ApiController

  skip_before_action :authorize, only: [:index, :show]

  def index
    @tasks = Task.all
    render json: TaskSerializer.new(@tasks).serializable_hash[:data].map { |task| task[:attributes] }
  end

  def show
    @task = Task.find(params[:id])
    render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes]
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes]
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end


  private

  def task_params
    params.permit(:title, :description, :status, :body, :user_id, :start_date, :end_date)
  end
end
