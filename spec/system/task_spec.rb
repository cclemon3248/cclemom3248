require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task1) { FactoryBot.create(:task, title: 'task1') }
  let!(:task2) { FactoryBot.create(:task, title: 'task2') }
  let!(:task3) { FactoryBot.create(:task, title: 'task3') }
  before do
    visit tasks_path
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "Title", with: "チャン"
        fill_in "Content", with: "ジュノ"
        fill_in "Deadline", with: "002022-03-31"
        fill_in "Status", with: "未着中"
        fill_in "Priority", with: "低"
        click_on "aaa"
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'task1'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task_list = all('.task_row') 
        expect(task_list[0]).to have_content 'task3'
        expect(task_list[1]).to have_content 'task2'
        expect(task_list[2]).to have_content 'task1'
      end
    end
  end
end