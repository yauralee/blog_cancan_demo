require 'rails_helper'
require 'cancan/matchers'


# def initialize(user)
# user ||= User.new
# if user.category == 'admin'
#   can :manage, :all
# elsif user.category == 'normal'
#   can [:create, :update, :destory], Article, user_id: user.id
#   can [:create, :update, :destroy], Comment, article_id: user.article.try(&:id)
# elsif user.category == 'guest'
#   can [:index, :show], Article, user_id: user.id
#   can [:index, :show], Comment, article_id: user.article.try(&:id)
# end
# end

# def new
#
# def create
#
# def show
#
# def index
# def edit
# def update
# def destroy
RSpec.describe Ability, type: :model do
  describe "User" do
    describe "abilities" do
      subject(:ability){ Ability.new(user) }
      let(:user){ FactoryGirl.create(:user) }
      let(:article){FactoryGirl.create(:article, user_id: user.id)}
      let(:comment) {FactoryGirl.create(:comment)}

      context "when is a normal user" do
        # it{ should be_able_to(:new, Article.new)}
        it{ should be_able_to(:update, article)}
        it{ should be_able_to(:destroy, article)}
      end

      context "when is a normal user" do
        # it{ should be_able_to(:create, Article.new)}
        it{ should be_able_to(:update, comment)}
        it{ should be_able_to(:destroy, comment)}
      end
    end

    describe "abilities" do
      let(:user){FactoryGirl.create(:user, category: 'admin')}
      subject(:ability){ Ability.new(user) }
      let(:article){FactoryGirl.create(:article, user_id: user.id)}
      let(:comment) {FactoryGirl.create(:comment)}

      context "when is a admin user" do
        it{ should be_able_to(:show, article)}
        it{ should be_able_to(:index, article)}
        it{ should be_able_to(:update, article)}
        it{ should be_able_to(:destroy, article)}
      end

      context "when is a admin user" do
        it{ should be_able_to(:show, comment)}
        it{ should be_able_to(:index, comment)}
        it{ should be_able_to(:update, comment)}
        it{ should be_able_to(:destroy, comment)}
      end
    end

    describe "abilities" do
      let(:user){FactoryGirl.create(:user, category: 'guest')}
      subject(:ability){ Ability.new(user) }
      let(:article){FactoryGirl.create(:article, user_id: user.id)}
      let(:comment) {FactoryGirl.create(:comment)}

      context "when is a guest" do
        it{ should be_able_to(:show, article)}
        it{ should be_able_to(:index, article)}
      end

      context "when is a guest" do
        it{ should be_able_to(:show, comment)}
        it{ should be_able_to(:index, comment)}
      end
    end
  end
end

