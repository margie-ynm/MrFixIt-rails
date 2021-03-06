class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if params[:mode] == 'pending' && current_worker
      @job.update(pending: true, worker_id: current_worker.id)
        respond_to do |format|
          format.html {redirect_to job_path(@job)}
          format.js
        end
    elsif params[:mode] == 'active' && current_worker
      @job.update(pending: false, active: true, worker_id: current_worker.id)
        respond_to do |format|
          format.html {redirect_to worker_path(current_worker)}
          format.js
        end
    elsif params[:mode] == 'completed' && current_worker
      @job.update(pending: false, active: false, completed: true, worker_id: current_worker.id)
        respond_to do |format|
          format.html {redirect_to worker_path(current_worker)}
          format.js
        end
      elsif
        render :show
        flash[:notice] = "Something went wrong!"
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to job_path(@job)
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
