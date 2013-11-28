ActiveAdmin.register User do


  sidebar "User Details", only: [:show, :edit] do
    ul do
      li link_to("Authentications", admin_user_authentications_path(user))
    end
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  permit_params :name, :email, :avatar_url
end
