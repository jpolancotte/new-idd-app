# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create! do |u|
#     u.email     = 'jpolanco1914@gmail.com'
#     u.password    = 'ABC987xyz$%'
#     u.superadmin_role=true
# end

# TaxonomyDescription.create(name: "Residential Treatment Facility, Intellectual and/or Developmental Disabilities")
# TaxonomyDescription.create(name: "Community Based Residential Treatment Facility, Intellectual and/or Developmental Disabilities")
# TaxonomyDescription.create(name: "Intermediate Care Facility, Intellectual Disabilities")
# TaxonomyDescription.create(name: "Community/Behavioral Health")


# Sales - Initial Communication	42683962
# Sales - Presentation	42683963
# Sales - Contract Negotiation	42683964
# Sales - Contract Signed	73978657
# Onboarding - In Progress	42683965
# Onboarding - Complete	42683966


day = 0

loop do
    
    start_date=Date.new(2023,10,23) + day

    end_date=start_date + 7

    week_number=start_date.cweek % 53 + 1

    pa=PipelineActivity.new
    pa.start_date=start_date
    pa.end_date=end_date
    pa.week_number=week_number
    pa.save

    day += 7
    break if day == 728

end
