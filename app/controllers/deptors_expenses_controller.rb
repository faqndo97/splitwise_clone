class DeptorsExpensesController < ApplicationController
  def index
    records = []

    if params[:deptor_id].present?
      #records = User.joins(:groups).where(groups: { id: params[:group_id] })
      records = User.find(params[:deptor_id]).expenses
    elsif params[:expense_id].present?
      #records = Group.joins(:users).where(users: { id: params[:user_id] })
      records = Expense.find(params[:expense_id]).deptors
    end

    render json: records, status: :ok
  end

  def create
    @deptor_expense = DeptorsExpense.new(deptor_expense_params)

    if @deptor_expense.save
      render json: @deptor_expense, status: :created
    else
      render json: @deptor_expense.errors, status: :unnprocessable_entity
    end
  end

  def destroy
    if params[:deptor_id].present? && params[:expense_id].present?
      DeptorsExpense.where(deptor_id: params[:deptor_id], expense_id: params[:expense_id]).delete_all

      head :ok
    else
      head :not_found
    end
  end

  private

  def deptor_expense_params
    params.require(:deptor_expense).permit(:deptor_id, :expense_id)
  end
end
