require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'Title', with: 'デジモン'
        fill_in 'Content', with: 'スパゲート'
        fill_in 'Deadline', with: '2022-04-03'
        fill_in 'Priority', with: '低'
        fill_in 'Status', with: '未着手'
        click_on 'aaa'
        expect(page).to have_content "デジモン"
        expect(page).to have_content "スパゲート"
        expect(page).to have_content "2022-04-03"
        expect(page).to have_content "低"
        expect(page).to have_content "未着手"
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task, title: 'task')
        visit task_path(task.id)
        expect(page).to have_content 'task'
       end
     end
  end
end