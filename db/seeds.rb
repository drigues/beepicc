user = User.find_or_create_by!(email: "test@beepi.cc") do |u|
  u.password = "password"
  u.password_confirmation = "password"
  u.name = "Test User"
  u.directory = "test"
end

profile = user.profile || Profile.create!(
  user: user,
  name: "Test User",
  bio: "Creator at Beepi",
  avatar_url: "https://placehold.co/100x100",
  color_theme: "purple",
  social_links: { instagram: "https://instagram.com/test" }
)

Link.create!([
  { user: user, title: "My Website", url: "https://beepi.cc", link_type: "custom", position: 1, click_count: 0 },
  { user: user, title: "YouTube", url: "https://youtube.com/@beepi", link_type: "youtube", position: 2, click_count: 0 }
]) unless user.links.any?
