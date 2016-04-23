# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
        '/'

    when /^the Login page$/
        new_user_session_path

    when /^the clinics listing page$/
        clinics_path

    when /^the users listing page$/
        '/profile'


    when /^the reviews listing page$/
        reviews_path

    when /^the review listing page for "(.*)"$/
        review_id = Review.find_by(title: $1).id
        "/reviews/#{review_id}"

    when /^the Create Profile page$/
        new_user_registration_path

    when /^profile page "([\d])"$/
        "/profile/#{$1}"

    when /^the clinics listing page for "(.*)"$/
        clinic_id = Clinic.find_by(name: $1).id
        "/clinics/#{clinic_id}"

    when /^the "Add Clinic" Page$/
        "/clinics/new"

    when /^the edit clinics page for "(.*)"$/
        clinic_id = Clinic.find_by(name: $1).id
        "/clinics/#{clinic_id}/edit"
        
    when /^the show clinics page for "(.*)"$/
        clinic_id = Clinic.find_by(name: $1).id
        "/clinics/#{clinic_id}"
        
    when /^the re edit clinics page for "(.*)"$/
        clinic_id = Clinic.find_by(name: $1).id
        "/clinics/#{clinic_id}"

    when /^the edit profile page$/
        "/users/edit"

    when /^the appointment scheduling page$/
        find_path

    when /^the appointments listing page$/
        "/search_appointments"

    when /^the profile page for "(.*)"$/
        #byebug
        puts "Email: #{$1}"
        users = User.all
        puts users.length
        users.each do |the_user|
            puts the_user.email
        end
        user_id = User.find_by(email: $1).id
        "/profile/#{user_id}"

    when /^the confirm deletion page for "(.*)"$/
        clinic_id = Clinic.find_by(name: $1).id
        "/clinics/confirm/#{clinic_id}"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    when /the edit page for "(.*)"/
        edit_movie_path(Movie.find_by(title: $1))

    when /the details page for "(.*)"/
        movie_path(Movie.find_by(title: $1))

    when /the Similar Movies page for "(.*)"/
        director_path(Movie.find_by(title: $1).director)

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
