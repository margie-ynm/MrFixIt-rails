
require 'rails_helper'

RSpec.describe Job do
  it { should have_db_column :title }
  it { should have_db_column :description }
  it { should have_db_column :completed }
  it { should have_db_column :pending }
  it { should have_db_column :active }
  it { should have_db_column :worker_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end
