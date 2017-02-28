require "rails_helper"

  describe "jobs pages" do
    before(:each) do
      @worker = FactoryGirl.create(:worker)
      visit new_worker_session_path
      fill_in 'Email', :with => @worker.email
      fill_in 'Password', :with => @worker.password
      click_button 'Log in'
    end

    it "allows a worker to add a job" do
      visit new_job_path
      fill_in :Title, :with => "job 1"
      fill_in :Description, :with => "description 1"
      click_button "Create Job"
      expect(page).to have_content("job 1")
    end
    it "a worker can mark a job as pending", js: true do
      job = create(:job)
      visit jobs_path
      click_link "job 1"
      click_link "click here to claim it now"
      expect(page).to have_content("You've successfully claimed this job!")
    end
    it "a worker can mark a job as pending", js: true do
      job = create(:job)
      visit jobs_path
      click_link "job 1"
      click_link "click here to claim it now"
      expect(page).to have_content("You've successfully claimed this job!")
    end
    it "a worker can mark a job as active", js: true do
      job = create(:job)
      visit jobs_path
      click_link "job 1"
      click_link "click here to claim it now"
      visit worker_path(@worker)
      click_on "Make this job active"
      expect(page).to have_content("description 1")
    end
    it "a worker can mark a job as active", js: true do
      job = create(:job)
      visit jobs_path
      click_link "job 1"
      click_link "click here to claim it now"
      visit worker_path(@worker)
      click_on "Make this job active"
      click_on "Mark this job as complete"
      expect(page).to have_content("Completed Jobs")
    end
  end
