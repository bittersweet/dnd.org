require File.dirname(__FILE__) + '/acceptance_helper'

feature "Feature name", %q{
  In order to display articles
  As a user
  I want to list and manage articles
} do

  scenario "Article index" do
    @article = Article.make!

    visit articles_index

    page.should have_content(@article.title)
  end

  scenario "Article show" do
    @article = Article.make!

    visit article_show(@article.id)

    page.should have_content(@article.title)
  end

  scenario "Create article" do
    admin_login

    visit articles_overview

    click 'New'

    fill_in 'article_title', :with => 'Article 1'
    fill_in 'article_content', :with => 'Article content'
    click 'article_submit'

    page.should have_content('Article was successfully created.')
    page.should have_content('Article 1')
  end

  scenario "Edit article" do
    admin_login

    @article = Article.make!

    visit articles_overview
    within("//tr[@id='article_#{@article.id}']") do
      click "Edit"
    end

    page.should have_content('Edit article')
    fill_in 'article_title', :with => 'Article edit'
    fill_in 'article_content', :with => 'Article content edit'
    click 'article_submit'

    page.should have_content('Article was successfully updated.')
    page.should have_content('Article edit')
  end

  scenario "Delete article" do
    admin_login

    @article = Article.make!

    visit articles_overview
    within("//tr[@id='article_#{@article.id}']") do
      click "Delete"
    end

    current_path.should == articles_overview

    page.should have_content('Article was successfully deleted.')
    page.should_not have_content(@article.title)
  end
end
