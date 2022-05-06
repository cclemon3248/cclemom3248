require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task1) { FactoryBot.create(:task, title: 'task1') }
  let!(:task2) { FactoryBot.create(:task, title: 'task2') }
  let!(:task3) { FactoryBot.create(:task, title: 'task3') }
  before do
    # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
    visit tasks_path
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される, 終了期限' do
        visit new_task_path
        fill_in "Title", with: 'task1'
        fill_in "Content", with: 'おじさん'
        fill_in "Deadline", with: "002022/03/03"
        select "未着手", from: "task_status"
        select "未着手", from: "task_status"
        select "低", from: "task_priority"
        click_button 'aaa'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'task1'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content 'task3'
        expect(task_list[1]).to have_content 'task2'
        expect(task_list[2]).to have_content 'task1'
      end
    end
  end
  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        # タスクの検索欄に検索ワードを入力する (例: task)
        # 検索ボタンを押す
        fill_in "Search for", with: "task1"
        click_on "Search"
        expect(page).to have_content 'task1'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # ここに実装する
        # プルダウンを選択する「select」について調べてみること
        select "未着手", from: "task_status"
        click_on "Search"
        expect(page).to have_content 'task1'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        fill_in "Search for", with: "task1"
        select "未着手", from: "task_status"
        click_on "Search"
        expect(page).to have_content 'task1'
      end
    end
  end
end