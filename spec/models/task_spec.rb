require 'rails_helper'

RSpec.describe Task, type: :model do
  current_user=User.first_or_create!(email: 'example@example.com',password: 'password',password_confirmation: 'password')
  it 'has a title' do
    task = Task.new(
      priority: 1,
      dueDate: Date.today,
      user_id: current_user.id
    )
    expect(task).to_not be_valid
  end
  it 'has a number as priority' do
    task = Task.new(
      title: 'Test',
      priority: 'test',
      dueDate: Date.today,
      user_id: current_user.id
    )
    expect(task).to_not be_valid
  end
  it 'has a future date' do
    task = Task.new(
      title: 'Test',
      priority: 1,
      dueDate: Date.yesterday,
      user_id: current_user.id
    )
    expect(task).to_not be_valid
  end
  it 'is valid' do
    task = Task.new(
      title: 'Test',
      priority: 1,
      dueDate: Date.today,
      user_id: current_user.id
    )
    expect(task).to be_valid
  end
end

