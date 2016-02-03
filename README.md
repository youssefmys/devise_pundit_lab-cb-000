# Devise Pundit Lab

## Objectives

We're going to learn how to integrate [CanCan] into a Rails application.
For our data model, we're going to return to our secret notes message board.

## Data model

We're going to have Users, Notes, and a viewers join table, which gives users read access to notes.

## Instructions

The lab comes with a Rails skeleton with Devise installed.

3. Add a role enum to the user model.
4. Write a policy governing the User model. Ensure all policy specs pass.
4. Add authentication and authorization filters to your users controller. Ensure that only administrators can update or destroy users.

We've included the relevant models/controllers and views from the CanCanCan lab so you don't have to rebuild them.  The data model is exactly the same, the only difference is that we're using Roles and Pundit to authorize actions rather than [CanCanCan].

Using the User policy as a guide, write a spec for the NotePolicy class, then write the NotePolicy class. You should ensure that:

  * Users can:
    * Create notes owned by them
    * Edit their own posts
    * Delete their own posts
    * Add viewers to their own posts
    * Remove viewers from their own posts
    * See notes they're viewers of
    * See their own notes
  * VIPs can:
    * See all notes.
  * Admins can:
    * Perform any action on a user or a note.

Once your policy spec is written and passes, write feature specs for creating, reading, and updating notes. You can copy the feature specs that currently exist for updating and deleting users.

## References
* [Pundit]

[Pundit]: https://github.com/elabs/pundit
[CanCanCan]: https://github.com/CanCanCommunity/cancancan

Blake Notes
to pass devise specs
need to add flash to layout
+  <%= content_tag(:div, flash[:error], :id => "flash_error") if flash[:error] %>
+  <%= content_tag(:div, flash[:notice], :id => "flash_notice") if flash[:notice] %>
+  <%= content_tag(:div, flash[:alert], :id => "flash_alert") if flash[:alert] %>
devise :database_authenticatable, :registerable, validatable
