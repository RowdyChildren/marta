module ApplicationHelper

	# This is where the user's station will be compared with the API data results

	def hash_and_msg_generator(results, station)
		# We will have a couple messages to tell the user whether or not the bus is coming
		@message = ""
		# We want to provide the user with the route and vehicle numbers for the approaching bus
		# The best way to store related info is a hash
		@buses = {}
		results.each do |result|
			if result ['TIMEPOINT'].include? station
				# If the user's selection matches an upcoming bus stop in the API data we will save info in our hash
				@buses[result["ROUTE"]] = result["VEHICLE"]
				# The route is the key and the Vehicle is the value
			end
		end
		if @buses.count == 0
			# no buses have the users's station as their next stop
			@message = "Sorry, it's gonna be a while."
		elsif @buses.count == 1
			# One bus will be making the users's station it's next stop
			@message = "This bus is on it's way:"
		elsif @buses.count > 1
			# Two or more buses will be making the user's station their next stop
			@message = "Theses buses will be coming soon:"
		else
			# Just in case we end up with a negative number
			@message = "Oooops...I think ther was an error."
		end
				
	end

end
