class TaskMailer < ApplicationMailer
    def task_due_reminder(user, task, message)
      @user = user
      @task = task
      mail(to: @user.email, subject: message)
    end
  end