require 'rufus-scheduler'
require_relative '../app/jobs/check_deadlines_job'

scheduler = Rufus::Scheduler.new

# Schedule the job to run every hour
scheduler.every '1m' do
  CheckDeadlinesJob.perform_now
end

# Keep the scheduler running
scheduler.join
