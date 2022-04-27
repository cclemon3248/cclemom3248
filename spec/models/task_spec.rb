require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '', content: '失敗テスト', deadline: "2022-03-31", priority: "低", status: "未実装")
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: 'うわん', content: '', deadline: "2022-03-31", priority: "低", status: "未実装")
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: 'うわん', content: '失敗テスト', deadline: "2022-03-31", priority: "低", status: "未実装")
        expect(task).to be_valid
      end
    end
  end
end