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

  private

  def work_params
    params.require(:work).permit(:title, :memo)
  end
end
