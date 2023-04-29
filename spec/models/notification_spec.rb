require 'rails_helper'

RSpec.describe Notification, type: :model do
  # Notificationモデルの関連付けが適切に設定されているかどうか
  describe 'associations' do
    it 'belongs to post' do
      expect(Notification.reflect_on_association(:post).macro).to eq :belongs_to
    end
    it 'belongs to comment' do
      expect(Notification.reflect_on_association(:comment).macro).to eq :belongs_to
    end
    it 'belongs to visitor' do
      expect(Notification.reflect_on_association(:visitor).macro).to eq :belongs_to
      expect(Notification.reflect_on_association(:visitor).class_name).to eq 'User'
    end
    it 'belongs to visited' do
      expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
      expect(Notification.reflect_on_association(:visited).class_name).to eq 'User'
    end
  end
end