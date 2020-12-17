FactoryBot.define do
  factory :task do
    task_name {"test task"}
    status    {"to do"}
    limit     {"2020-12-25"}
  end
end
