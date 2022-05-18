module TasksHelper
  def choose_new_or_edit
    if action_name == 'new'
      new_task_path
    elsif action_name == 'edit'
      edit_task_path
    end
  end
end

