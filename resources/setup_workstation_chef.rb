resource_name :setup_workstation_chef

property :gems, Array, required: false

action :run do
  gems = (new_resource.gems or node['workstation']['chef']['gems'])
  gems.each do |gem|
    chef_gem gem do
      compile_time false
    end
  end
end
