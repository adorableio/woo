# encoding: UTF-8

require 'spec_helper'

describe 'Styleguide home' do

  before do
    visit '/styleguide'
  end

  it 'is loaded' do
    expect(current_path).to eq '/styleguide'
  end
end
