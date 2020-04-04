class GroupsUsersController < ApplicationController
  def index
    records = []

    if params[:group_id].present?
      #records = User.joins(:groups).where(groups: { id: params[:group_id] })
      records = Group.find(params[:group_id]).users
    elsif params[:user_id].present?
      #records = Group.joins(:users).where(users: { id: params[:user_id] })
      records = User.find(params[:user_id]).groups
    end

    render json: records, status: :ok
  end

  def create
    @group_user = GroupsUser.new(group_user_params)

    if @group_user.save
      render json: @group_user, status: :created
    else
      render json: @group_user.errors, status: :unnprocessable_entity
    end
  end

  def destroy
    if params[:group_id].present? && params[:user_id].present?
      GroupsUser.where(group_id: params[:group_id], user_id: params[:user_id]).delete_all

      head :ok
    else
      head :not_found
    end
  end

  private

  def group_user_params
    params.require(:group_user).permit(:group_id, :user_id)
  end
end
