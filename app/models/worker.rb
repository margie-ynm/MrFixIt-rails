class Worker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs

  def self.show_completed(worker)
    job_list = []
    worker.jobs.each do |job|
      if job.completed
        job_list.push(job)
      end
    end
    job_list
    end

    def self.show_activated(worker)
      job_list = []
      worker.jobs.each do |job|
        if job.active
          job_list.push(job)
        end
      end
      job_list
    end
end
