### Compliance chimp ###

[get started](http://www.ComplianceChimp.com) | [suggest a feature](https://github.com/akshatpradhan/compliance_chimp/issues) |
[install locally](https://github.com/akshatpradhan/compliance_chimp/wiki)

A workflow tool to manage PCI Compliance easily


![Screenshot](https://raw.github.com/akshatpradhan/compliance_chimp/master/ComplianceChimp.png)


Credits
-------

http://www.linkedin.com/in/akshatpradhan

License
-------

GNU Affero General Public License v3 (AGPL-3.0)!

See [LICENSE.txt](https://raw.githubusercontent.com/akshatpradhan/compliance_chimp/master/LICENSE.txt)

Copyright 2013 Compliance chimp

Getting Started
---------------

See wiki.

Documentation and Support
-------------------------

This is the only documentation.

#### Issues

See Github issues.

Similar Projects
----------------

http://www.ServiceNow.com

Contributing
------------

If you make improvements to this application, please share with others.

-   Fork the project on GitHub.
-   Make your feature addition or bug fix.
-   Commit with Git.
-   Send Compliance chimp a pull request.

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please file a Github issue and we’ll add a note to the README so that others can find your work.

Diagnostics
-----------

This application was built with recipes that are known to work together.

This application was built with preferences that are NOT known to work
together.

If the application doesn’t work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include these diagnostics:

We’d also like to know if you’ve found combinations of recipes or
preferences that do work together.

Recipes:

* apps4
* controllers
* core
* email
* extras
* frontend
* gems
* git
* init
* models
* prelaunch
* railsapps
* readme
* routes
* saas
* setup
* testing
* views

Preferences:

* git: true
* railsapps: none
* dev_webserver: thin
* prod_webserver: thin
* database: mongodb
* orm: mongoid
* templates: erb
* unit_test: rspec
* integration: rspec-capybara
* continuous_testing: guard
* fixtures: factory_girl
* frontend: bootstrap3
* email: mandrill
* authentication: omniauth
* omniauth_provider: github
* authorization: cancan
* form_builder: simple_form
* starter_app: admin_app
* rvmrc: false
* quiet_assets: true
* local_env_file: figaro
* better_errors: true
* ban_spiders: true
* github: true

Ruby on Rails
-------------

This application requires:

-   Ruby
-   Rails

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Database
--------

This application uses MongoDB with the Mongoid ORM.

`brew install mongodb`


Development
-----------

-   Template Engine: ERB
-   Testing Framework: RSpec and Factory Girl
-   Front-end Framework: Twitter Bootstrap 3.0 (Sass)
-   Form Builder: SimpleForm
-   Authentication: OmniAuth
-   Authorization: CanCan
-   Admin: None

Email
-----

The application is configured to send email using a Mandrill account.

Email delivery is disabled in development.
