require "rails_helper"

  describe "jobs pages" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', :with => '@user.email'
      fill_in 'Password', :with => '@user.password'
      click_button 'Log in'
    end

    it "allows a user to add a job" do
      visit new_job_path
      fill_in :Title, :with => "job 1"
      fill_in :Description, :with => "description 1"
      click_button "Create Job"
      expect(page).to have_content("job 1")
    end
  end
