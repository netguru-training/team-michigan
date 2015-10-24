ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :email, :password, :password_confirmation

  member_action :publish, method: :put do
    resource.add_role :teacher
    resource.save
    redirect_to admin_user_path
  end

  action_item :publish, only: :show do
    link_to 'Mark as a teacher', publish_admin_user_path(resource), method: :put
  end

  index do
    selectable_column
    id_column
    column :email
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end


end
