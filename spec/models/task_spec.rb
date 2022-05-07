require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    let!(:task) { FactoryBot.create(:task, title: 'task') }
    let!(:second_task) { FactoryBot.create(:task, title: "sample", status: "完了") }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.top1("task")).to include(task)
        expect(Task.top1("task")).not_to include(second_task)
        expect(Task.top1("task").count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.top2("未着手")).to include(task)
        expect(Task.top2("未着手")).not_to include(second_task)
        expect(Task.top2("未着手").count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに内容を記載する
        expect(Task.top3("task", "未着手")).to include(task)
        expect(Task.top3("task", "未着手")).not_to include(second_task)
        expect(Task.top3("task", "未着手").count).to eq 1
      end
    end
  end
end