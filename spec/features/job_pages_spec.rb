require "rails_helper"

  describe "jobs pages" do
    before(:each) do
      @user = FactoryGirl.create(:worker)
      visit new_worker_session_path
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with => @user.password
      click_button 'Log in'
    end

    it "allows a user to add a job" do
      visit new_job_path
      fill_in :Title, :with => "job 1"
      fill_in :Description, :with => "description 1"
      click_button "Create Job"
      expect(page).to have_content("job 1")
    end
    it "a user can mark a job as pending", js: true do
      job = create(:job)
      visit jobs_path
      click_link "job 1"
      click_link "click here to claim it now"
      expect(page).to have_content("You've successfully claimed this job!")
    end
  end
