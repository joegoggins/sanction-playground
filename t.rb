#ROLES PAGE
require 'pp'

x= {PrincipalClass => {princ_instance => {:perms_class => bla, instances => [permissionables]}}}

x.keys.each do |principal_class|
  if x.keys.length > 1
    puts principal_class.to_s
  end
  x[principal_class]
end

super_user +
  name
editor +
  <princ class name>
  name ...over... -
    <perm class name>
    inst1 -
    inst2 -
    inst3 -
    <perm class name2>
    inst1 -
    inst2 -
    inst3 -
  <princ class name>
  name ...over... -
    <perm class name>
    inst1 -
    inst2 -
    inst3 -
    <perm class name2>
    inst1 -
    inst2 -
    inst3 -   
viewer +
  <princ class naem>
  name (OVER ALL <perm class name>s)
  name 
    <perm class name>
    inst1
    inst2


r = Renderer.new(@roles, [:role_definition, :principals, :permissionables])
# Mixes in a bunch functionality into core Sanction objects to
# make view rendering not suck a pile of balls
#
r.load

r.role_definitions.each do |rd|
  puts rd.to_html
  rd.roles.each do |role|
    gd.principals.each do |p|
      if gd.global?
        puts p.to_html
      else
        
      end
    end
  end
end

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
      role_def.permissionables.each do |permissionable_class| # ["Magazine", "User"]
  
        @actual_roles = @roles.find_all {|r|
           r.name.to_sym == role_def.name && 
           r.principal_type.to_s == principal_class &&
           r.permissionable_type.to_s == permissionable_class
        }
        @actual_roles.sort! {|a,b| "#{a.principal_type} #{a.permissionable_type}" <=> "#{b.principal_type} #{b.permissionable_type}"}
        
        # Only render the name once
        rendered_principal_ids = []
        @actual_roles.each do |granular_role|
          unless rendered_principal_ids.include? granular_role.principal_id
            if granular_role.principal.blank?
              puts "  Invalid non-existant principal"
            else
              if role_def.principals.length > 1
                puts "  #{granular_role.principal.name} (#{principal_class.to_s})"
              else
                puts "  #{granular_role.principal.name}"
              end
            end
            rendered_principal_ids << granular_role.principal_id
          end
          
          if granular_role.permissionable.blank?
            puts "    Access over all #{granular_role.permissionable_type.to_s.pluralize}"
          else
            # Indicate the class if there are multiple types of permissionables
            #
            if role_def.permissionables.length > 1
              puts "    #{granular_role.permissionable.name} (#{permissionable_class.to_s})"
            else
              puts "    #{granular_role.permissionable.name}"
            end
          end
        end      
        
      end
    end
  end  
end

