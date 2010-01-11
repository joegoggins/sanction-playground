#ROLES PAGE
require 'pp'
# eager loaded for quick rendering
@roles = Sanction::Role.find(:all, :include => [:principal, :permissionable], :order => 'name')

Sanction::Role::Definition.names.each do |role_name| # [:super_user, :writer, :viewer]
  puts "ROLE: #{role_name.to_s.humanize}"
  # Is this a global role definition?
  #
  if Sanction::Role::Definition.with(role_name).first.global?
    @global_roles = @roles.find_all {|r| r.name.to_sym == role_name}
    @global_roles.each do |global_role|
      puts "  #{global_role.principal.name}"
    end
    next # Skip the rest of the loop
  end
  
  # Only non-globals execute these nested loops below
  #
  Sanction::Role::Definition.with(role_name).each do |role_def|
    role_def.principals.each do |principal_class| # ["User", "ApiUser"]
      # if role_def.principals.length > 1
      #         puts "  PRINCIPAL CLASS: #{principal_class.to_s}"
      #       end
      role_def.permissionables.each do |permissionable_class| # ["Magazine", "User"]
        # if role_def.permissionables.length > 1
        #   puts "  PERMISSIONABLE CLASS: #{permissionable_class.to_s}"
        # end     
        
        
        @actual_roles = @roles.find_all {|r|
           r.name.to_sym == role_def.name && 
           r.principal_type.to_s == principal_class &&
           r.permissionable_type.to_s == permissionable_class
        }
       # pp @actual_roles
        @actual_roles.sort! {|a,b| "#{a.principal_type} #{a.permissionable_type}" <=> "#{b.principal_type} #{b.permissionable_type}"}
        @actual_roles.each do |granular_role|
          if granular_role.permissionable.blank?
            puts "  Access over all #{granular_role.permissionable_type.to_s.pluralize}"
          else
            puts "  #{granular_role.permissionable.name}"
          end
        end      
        
      end
    end
  end  
end

