require 'spec_helper'

describe "basic link shortening", :type => :feature do
  before :each do
  end

  it "shortens a link" do
    visit '/shorten'
    within("#new_link") do
      fill_in 'Url', :with => 'http://www.google.com'
    end

    find('.actions input').click

    expect(page).to have_content 'Link was successfully created.'
    expect(page).to have_content 'http://www.google.com' # original URL
    #expect(page).to have_css('#shortenend_url') '' # shortend URL
  end

  it "accessing a shortenend link redirects the user to the original link" do
    visit '/shorten'
    within("#new_link") do
      fill_in 'Url', :with => 'http://www.google.com'
    end

    find('.actions input').click
    shortenend_link = find('#shortenend_url').text

    visit(shortenend_link)

    current_url.should == 'http://www.google.com/'
  end

  it "if we try shorten the same link more than once, reuse the first entry and not generate new short links for the same url" do
    visit '/shorten'
    within("#new_link") do
      fill_in 'Url', :with => 'http://www.google.com'
    end

    find('.actions input').click

    shortenend_link_1 = find('#shortenend_url').text

    visit '/shorten'
    within("#new_link") do
      fill_in 'Url', :with => 'http://www.google.com'
    end

    find('.actions input').click

    shortenend_link_2 = find('#shortenend_url').text

    shortenend_link_1.should == shortenend_link_2
  end
end
