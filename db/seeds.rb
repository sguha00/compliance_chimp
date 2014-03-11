# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.mongo_session['roles'].insert({ :name => role })
  puts 'role: ' << role
end

# TODO DRY up seeding the database
Requirement.create(name: "1.1.1", description: "A formal process for approving and testing all network connections and changes to the firewall and router configurations")
Requirement.create(name: "1.1.2", description: "Current network diagram that identifies all connections between the cardholder data environment and other networks, including any wireless networks
")
Requirement.create(name: "1.1.3", description: "Current diagram that shows all cardholder data flows across systems and networks")
Requirement.create(name: "1.1.4", description: "Requirements for a firewall at each Internet connection and between any demilitarized zone (DMZ) and the internal network zone")
Requirement.create(name: "1.1.5", description: "Description of groups, roles, and responsibilities for management of network components")
Requirement.create(name: "1.1.6", description: "Documentation and business justification for use of all services, protocols, and ports allowed, including documentation of security features implemented for those protocols considered to be insecure. Examples of insecure services, protocols, or ports include but are not limited to FTP, Telnet, POP3, IMAP, and SNMP v1 and v2.")
Requirement.create(name: "1.1.7", description: "Requirement to review firewall and router rule sets at least every six months")
Requirement.create(name: "1.2.1", description: "Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment, and specifically deny all other traffic.")
Requirement.create(name: "1.2.2", description: "Secure and synchronize router configuration files.")
Requirement.create(name: "1.2.3", description: "Install perimeter firewalls between all wireless networks and the cardholder data environment, and configure these firewalls to deny or, if traffic is necessary for business purposes, permit only authorized traffic between the wireless environment and the cardholder data environment.")
Requirement.create(name: "1.3.1", description: "Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports.")
Requirement.create(name: "1.3.2", description: "Limit inbound Internet traffic to IP addresses within the DMZ.")
Requirement.create(name: "1.3.3", description: "Do not allow any direct connections inbound or outbound for traffic between the Internet and the cardholder data environment.")
Requirement.create(name: "1.3.4", description: "Implement anti-spoofing measures to detect and block forged source IP addresses from entering the network. For example, block traffic originating from the Internet with an internal source address.")
Requirement.create(name: "1.3.5", description: "Do not allow unauthorized outbound traffic from the cardholder data environment to the Internet.")
Requirement.create(name: "1.3.6", description: "Implement stateful inspection, also known as dynamic packet filtering. That is, only established connections are allowed into the network.")
Requirement.create(name: "1.3.7", description: "Place system components that store cardholder data (such as a database) in an internal network zone, segregated from the DMZ and other untrusted networks.")
Requirement.create(name: "1.3.8", description: "Do not disclose private IP addresses and routing information to unauthorized parties.")

