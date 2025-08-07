class FileUploadsController < ApplicationController
  before_action :authorize_request, except: [:public]

  def index
    files = @current_user.file_uploads.with_attached_file
    render json: files.map { |f| format_file(f) }
  end

  def create
    file = @current_user.file_uploads.new(file_upload_params)
    file.file.attach(params[:file])
    if file.save
      render json: format_file(file), status: :created
    else
      render json: { errors: file.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    file = @current_user.file_uploads.find_by(id: params[:id])
    if file
      file.destroy
      render json: { message: "File deleted" }
    else
      render json: { error: "File not found" }, status: :not_found
    end
  end

  def public
    file = FileUpload.find_by(shared_slug: params[:slug], is_public: true)
    if file&.file&.attached?
      redirect_to Rails.application.routes.url_helpers.rails_blob_url(file.file, only_path: true)
    else
      render json: { error: "File not found or not public" }, status: :not_found
    end
  end

  private

  def file_upload_params
    params.permit(:title, :description, :is_public)
  end

  def format_file(f)
    {
      id: f.id,
      title: f.title,
      description: f.description,
      is_public: f.is_public,
      file_url: Rails.application.routes.url_helpers.rails_blob_url(f.file, only_path: true),
      public_url: "/public/#{f.shared_slug}"
    }
  end
end

