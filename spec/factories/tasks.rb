FactoryBot.define do
    factory :task do
      title { "Sample Task" }
      description { "This is a sample task." }
      status { "backlog" }
      deadline { 2.days.from_now }
      association :user
    end
  end
  