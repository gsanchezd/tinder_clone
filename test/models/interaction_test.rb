require 'test_helper'

class InteractionTest < ActiveSupport::TestCase

  test 'cant interact with myself' do
    i = Interaction.new(user_one:users(:one), user_two:users(:one))
    assert_not i.valid?, "cant interact with myself"
  end

  test 'can interact with other user' do
    i = Interaction.new(user_one:users(:one), user_two:users(:two))
    assert i.valid?, "can interact with other user"
  end

  test 'cant interact twice with the same user' do
    i = Interaction.new(user_one:users(:one), user_two:users(:two))
    i2 = Interaction.new(user_one:users(:one), user_two:users(:two))
    assert i2.valid?, "can interact with other user"
  end

  test 'if two users like each other a match must exist' do
    i = Interaction.create(user_one:users(:one), user_two:users(:two), like:true)    
    i2 = Interaction.create(user_one:users(:two), user_two:users(:one), like:true)

    m = Match.where(user_one:i.user_one, user_two:i.user_two)
    assert_not_nil m, "a match must exist"
  end

  test 'if two users interact with each other but one doesnt like two, the is no match' do
    i = Interaction.create(user_one:users(:one), user_two:users(:two), like:true)    
    i2 = Interaction.create(user_one:users(:two), user_two:users(:one), like:false)
    m = Match.where(user_one:i.user_one, user_two:i.user_two)
    assert_empty m, "there must be no match"
  end

end
