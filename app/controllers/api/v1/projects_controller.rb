class Api::V1::ProjectsController < ApiController
  def index
    @projects = Project.all
    render json: ProjectSerializer.new(@projects).serializable_hash[:data].map { |project| project[:attributes] }
  end

  def show
    @project = Project.find(params[:id])
    render json: ProjectSerializer.new(@project).serializable_hash[:data][:attributes]
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: ProjectSerializer.new(@project).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.permit(:title, :description)
  end
end
