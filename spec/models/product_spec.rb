require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'saves a product with all info' do
      @category = Category.new(name: 'Flowers1')
      @category.save!

      @product = Product.new(
        name: 'Sunflower',
        category_id: @category.id,
        quantity: 10,
        price: 10
      )
      @product.save!

      expect(@product.id).to be_present
    end

    it 'checks if name is present' do
      @category = Category.new(name: 'Flowers2')
      @category.save!

      @product = Product.new(
        category_id: @category.id,
        quantity: 10,
        price: 10
      )
      @product.valid?

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'checks if price is present' do
      @category = Category.new(name: 'Flowers3')
      @category.save!

      @product = Product.new(
        name: 'Sunflower',
        category_id: @category.id,
        quantity: 10,
      )
      @product.valid?

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'checks if quantity is present' do
      @category = Category.new(name: 'Flowers4')
      @category.save!

      @product = Product.new(
        name: 'Sunflower',
        category_id: @category.id,
        price: 10
      )
      @product.valid?

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'checks if category is present' do
      @category = Category.new(name: 'Flowers5')
      @category.save!

      @product = Product.new(
        name: 'Sunflower',
        quantity: 10,
        price: 10
      )
      @product.valid?

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
