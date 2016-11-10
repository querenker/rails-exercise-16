FactoryGirl.define do
  factory :paper do
    title "COMPUTING MACHINERY AND INTELLIGENCE"
    venue "Mind 49: 433-460"
    year 1950
    authors {build_list :author, 1}
  end

  factory :new_paper, class: :paper do
    title "Go To Statement Considered Harmful"
	venue "Communications of the ACM 11: 147-148"
	year 1968
	authors {build_list :author, 1}
  end

end
