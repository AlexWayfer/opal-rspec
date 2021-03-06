rspec_filter 'respond_to' do
  # arity + splat related in opal (more related to Method#arity than arity checking)
  filter('expect(...).to respond_to(:sym).with(1).argument passes if target responds to any number of arguments').unless { at_least_opal_0_10? }
  filter('expect(...).to respond_to(:sym).with(2).arguments passes if target responds to one or more arguments').unless { at_least_opal_0_10? }
  filter('expect(...).not_to respond_to(:sym).with(1).argument fails if target responds to :sym with any number of args').unless { at_least_opal_0_10? }
  filter('expect(...).not_to respond_to(:sym).with(2).arguments fails if target responds to :sym with one or more args').unless { at_least_opal_0_10? }
end
