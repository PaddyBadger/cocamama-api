json.(@user,
	:id,
	:email,
	:name 
)
json.participation_trackers @user.participation_trackers do |tracker|
	json.goal tracker.tracker_goal
	json.tracker tracker
	json.tracker_steps tracker.steps
end
