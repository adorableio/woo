# encoding: UTF-8

require 'spec_helper'

describe 'Styleguide' do

  before do
    visit '/styleguide'
  end

  it 'is loaded' do
    expect(current_path).to eq '/styleguide'
  end

  it 'has a width menu' do
    expect(page).to have_content('Width')
  end

  it 'resizes to 320px width' do
    expect(page).to have_content('320')
  end

  it 'resizes to 480px width' do
    expect(page).to have_content('480')
  end

  it 'resizes to 748px width' do
    expect(page).to have_content('748')
  end

  it 'resizes to 960px width' do
    expect(page).to have_content('960')
  end
  it 'resizes to 1024px width' do
    expect(page).to have_content('1024')
  end
  it 'resizes to 1280px width' do
    expect(page).to have_content('1280')
  end
  it 'resizes to iPhone resolution' do
    expect(page).to have_content('iPhone')
  end
  it 'resizes to Full Screen width' do
    expect(page).to have_content('Full')
  end
end
