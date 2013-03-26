Given /^I am on talks screen$/ do
  wait_for_elements_exist(["navigationItemView marked:'Talks'"])
end

Then /^I day (\d+) should be pre-selected$/ do |day_num_s|
  day_str = "DAY #{day_num_s}"
  selected = query("button {accessibilityLabel BEGINSWITH '#{day_str}'}", :isSelected)
  screenshot_and_raise "#{day_str} was not selected" unless selected.first == "1"
end

When /^I should see the schedule for day (\d+)$/ do |day_num_s|
  day_sym = "day#{day_num_s}".to_sym

  expected_talks = TALKS[day_sym]

  talk_index = 0

  each_cell(animate:false,post_scroll:0.3) do |row, sec|
    title_label_for_cell = query("tableViewCell indexPath:#{row},#{sec} view:'MTLabel'",:text)
    title = title_label_for_cell.first
    next if /Break|Lunch/.match(title)


    expected_title = expected_talks[talk_index][:title]
    puts expected_title
    unless expected_title.downcase == title.downcase
      screenshot_and_raise("Expected talk: #{expected_title} found #{title}")
    end


    talk_index += 1

  end

end