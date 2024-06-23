ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../config/environment', __dir__)
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '* * * * *' do
    puts "Job running every minute"
    Task.where(status: ['backlog', 'in_progress']).each do |task|
        if task.deadline >= 1.day.from_now - 1.minute && task.deadline <= 1.day.from_now
            task.deadline <= 1.day.from_now && task.deadline > 23.hours.from_now
            message = "Task expiring in a day"
            TaskMailer.task_due_reminder(task.user, task, message).deliver_now
        elsif task.deadline >= 1.hour.from_now - 1.minute && task.deadline <= 1.hour.from_now
            message = "Task expiring in an hour"
            TaskMailer.task_due_reminder(task.user, task, message).deliver_now
        end
    end
end

scheduler.join
