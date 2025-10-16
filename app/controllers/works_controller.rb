class WorksController < ApplicationController
  def index
    @works = Work.includes(:user)
  end

  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.build(work_params)
    if @work.save
      redirect_to works_path, success: t("defaults.flash_message.created", item: Work.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Work.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = current_user.works.find(params[:id])
  end

  def update
    @work = current_user.works.find(params[:id])
    if @work.update(work_params)
      redirect_to work_path(@work), success: t("defaults.flash_message.updated", item: Work.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: Work.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @work = current_user.works.find(params[:id])
    @work.destroy!
    redirect_to works_path, success: t("defaults.flash_message.deleted", item: Work.model_name.human)
  end

  def select_record_method
    @work = current_user.works.find(params[:id])
  end

  def timer
    @work = current_user.works.find(params[:id])
  end

  def stopwatch
    @work = current_user.works.find(params[:id])
  end

  private

  def work_params
    params.require(:work).permit(:title, :memo, :status, :total)
  end
end
