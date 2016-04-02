json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :start_time, :end_time, :treatment_options
  json.url schedule_url(schedule, format: :json)
end
