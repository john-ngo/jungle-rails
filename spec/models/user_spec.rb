require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'saves a user with all info' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      @user.save!

      expect(@user.id).to be_present
    end

    it 'checks if first name is present' do
      @user = User.new(
        last_name: 'Doe',
        email: 'a@a.com',
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'checks if last name is present' do
      @user = User.new(
        first_name: 'John',
        email: 'a@a.com',
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'checks if email is present' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'checks if email is unique' do
      @user1 = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      @user1.save!

      @user2 = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'A@A.COM',
        password: '1234567890',
        password_confirmation: '1234567890'
      )
      @user2.valid?

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'checks if password is present' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password_confirmation: '1234567890'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'checks if password is at least 8 characters' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password: '123',
        password_confirmation: '1234567890'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it 'checks if password_confirmation is present' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password: '1234567890'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'checks if password is at least 8 characters' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password: '1234567890',
        password_confirmation: '123'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 8 characters)")
    end

    it 'checks if password_confirmation matches password' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'a@a.com',
        password: '1234567890',
        password_confirmation: '12345678'
      )
      @user.valid?

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


  end
end
