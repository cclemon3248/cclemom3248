require 'rails_helper'

describe "タスク作成" do
  context '【条件別にグループ化（〇〇の場合）】' do
    before do
      @user1 = FactoryBot.create(:user)
      @label1 = FactoryBot.create(:label)
      @label2 = FactoryBot.create(:label, tag: "おじいさん" )
      visit new_session_path
      fill_in "Email", with: 'cclemon3247@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      visit new_task_path
      fill_in "Title", with: 'task1'
      fill_in "Content", with: 'おじさん'
      fill_in "Deadline", with: "002022/03/03"
      select "未着手", from: "task_status"
      select "低", from: "task_priority"
    end
    
    it "ラベルを選択してからタスクを作成する" do
      check("task_label_ids_#{@label1.id}")
      click_button 'aaa'
      visit root_path
      expect(page).to have_content 'おじさん'
    end
    
    it "複数のラベルを選択してからタスクを作成する" do
      check("task_label_ids_#{@label1.id}")
      check("task_label_ids_#{@label2.id}")
      click_button 'aaa'
      visit root_path
      expect(page).to have_content 'おじさん'
      expect(page).to have_content 'おじいさん'
    end
  end
end

describe "ラベル変更" do
  context '【条件別にグループ化（〇〇の場合）】' do
    before do
      @task1 = FactoryBot.create(:task)
      visit new_session_path
      fill_in "Email", with: 'cclemon3247@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
      # binding.irb
    end
    it "ラベルを削除する" do
      visit root_path
      click_on '編集'
      uncheck("task_label_ids_#{Label.first.id}")
      click_button 'aaa'
      expect(find("tbody")).not_to have_content "おじさん"
    end
    
    it "ラベルを追加する" do
      visit root_path
      click_on '編集'
      check("task_label_ids_#{Label.last.id}")
      click_button 'aaa'
      expect(find("tbody")).to have_content "おじいさん"
    end
  end
end



describe "ラベル検索" do
  context '【条件別にグループ化（〇〇の場合）】' do
    before do
      @task1 = FactoryBot.create(:task)
      visit new_session_path
      fill_in "Email", with: 'cclemon3247@naver.com'
      fill_in "Password", with: "djdjdjdj1"
      click_button 'Log in'
    end
    it "ラベルを入力して検索したら表示される" do
      visit root_path
      select "おじさん", from: "task_label_ids"
      click_on "Search"
      expect(page).to have_content 'おじさん'
    end
    
    it "ラベルがない状態で検索したら何も表示されない" do
      visit root_path
      select "おじさん", from: "task_label_ids"
      click_on "Search"
      expect(page).to have_content 'おじいさん'
    end
  end
end