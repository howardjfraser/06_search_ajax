Person.delete_all

64.times do
  name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  Person.create! name: name, job_title: FFaker::Job.title, bio: FFaker::Lorem.paragraph
end
