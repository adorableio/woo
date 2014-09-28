# encoding: UTF-8

require 'spec_helper'

describe 'Styleguide home' do

  context 'with an issued loan' do
    it 'is on Account home' do
      visit '/styleguide'
      expect(current_path).to eq '/styleguide'
    end
  end
end
