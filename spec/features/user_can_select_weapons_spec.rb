feature 'User can select weapon' do
  scenario 'User selects rock' do
    enter_name_and_confirm
    select 'Rock', :from => "player_1_weapon"
    click_button "Lets get started!"
    expect(page).to have_content "Leigh-ann you chose ROCK!"
  end
  scenario 'User selects paper' do
    enter_name_and_confirm
    select 'Paper', :from => "player_1_weapon"
    click_button "Lets get started!"
    expect(page).to have_content "Leigh-ann you chose PAPER!"
    expect(page).not_to have_content "Leigh-ann you chose ROCK!"
  end
  scenario 'User selects scissors' do
    enter_name_and_confirm
    select 'Scissors', :from => "player_1_weapon"
    click_button "Lets get started!"
    expect(page).to have_content "Leigh-ann you chose SCISSORS!"
    expect(page).not_to have_content "Leigh-ann you chose PAPER!"
  end
end

feature 'User can cannot select a weapon other than RockPaperScissors' do
  scenario 'User picks an option from list ' do
    enter_name_and_confirm
		expect(page).to have_select("player_weapon", :with_options => ["Rock", "Scissors", "Paper"])
		expect(page).not_to have_select("player_weapon", options: ["gun"])
	end
end

feature 'Mutliplayers can both enter weapons' do
  scenario 'Player 1 chooses rock, player 2 choses paper' do
    multi_player_names_and_confirm
    select 'Rock', :from => "player_1_weapon"
    select 'Paper', :from => "player_2_weapon"
    expect(page).to have_content "Leigh-ann you chose ROCK!"
    expect(page).not_to have_content "Andy you chose PAPER!"
  end
end