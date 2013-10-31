#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'

$config["browsers"].each do |b|
    describe 'The Yale home page', :yale do
        
        before(:all) do
            @browser = Watir::Browser.new b
            @yale_page = YalePage.new(@browser)
            @yale_page.goto
        end
        
        it 'has the correct title' do
            expect(@yale_page.title).to eq 'Yale University'
        end
        
        it 'has the correct text' do
            expect(@yale_page.text).to include 'Harvard'
        end
        
        it 'has the correct links'
        
        describe 'The Yale search', :yale do
            term = "stuff"
            it "has the correct results for '#{term}'" do
                result_page = @yale_page.search_for term
                expect(result_page.term_found?(term)).to eq true
            end
        end
        after(:all) do
            @browser.close rescue nil
        end
    end
end
