require 'rails_helper'


RSpec.describe 'Plot Index' do
  before :each do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden_2 = Garden.create!(name: "Billy's Personal Garden", organic: false)

    @plot_1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: @garden_1.id)
    @plot_2 = Plot.create!(number: 30, size: "Medium", direction: "North", garden_id: @garden_1.id)
    @plot_3 = Plot.create!(number: 35, size: "Small", direction: "South", garden_id: @garden_2.id)

    @plant_1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = Plant.create!(name: "Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_3 = Plant.create!(name: "Root", description: "Prefers rich, well draining soil.", days_to_harvest: 90)

    @plot_plant_1 = PlotPlant.create!(plot_id: @plot_1.id, plant_id: @plant_1.id)
  end
  it 'can display all plot numbers' do
    visit '/plots'
    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
  end
  it 'can display all plants names associated to the plot number' do
    visit '/plots'

    expect(page).to have_content(@plant_1.name)

  end
  it 'can remove a plant from a plot' do
    visit '/plots'
    expect(page).to have_link("delete")
    click_link 'delete'
    expect(current_path).to eq('/plots')
    expect(page).to have_no_content(@plant_1.name)
  end
end
