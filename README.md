# Devise Pundit Lab

## Objectives

We're going to learn how to integrate [CanCan] into a Rails application.
For our data model, we're going to return to our secret notes message board.

## Data model

We're going to have Users, Notes, and a viewers join table, which gives users read access to notes.

## Instructions

The lab comes with a Rails skeleton with Devise installed.

1. Use `rails generate devise User` to generate a User model with Devise enabled.
2. Run the migrations.
3. Add a role enum to the user model.
4. Write a policy governing the User model. Ensure all policy specs pass.
4. Add authentication and authorization filters to your users controller. Ensure that only administrators can update or destroy users.

Now we'll create a `Note` model and our `Viewer` model.

1. Create a `Note` model. `Note`s have `content`, and a `user`, their creator.
2. Create a `Viewer` model. `viewers` is a join between `notes` and and `users`. An entry in the `Viewer`s table means that `user` can view that `note`. 

Hint: There are a few ways to set up the relationship between `Note`s and `User`s. Here's what I did and what the tests expect:

    # user.rb
    has_many :viewers
    has_many :readable, through: :viewers, source: :note

    # note.rb
    has_many :viewers
    has_many :readers, through: :viewers, source: :user

Your `Note` model will need `visible_to` and `visible_to=` methods, which take a comma-separated list of user names, and turns that list into the `Note`'s `viewers` relation. There are tests for this; ensure they pass.

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

Once your policy spec is written and passes, write feature specs for creating, reading, and updating notes. You can copy the feature specs that currently exist for updating and delting users.

## References
* [Pundit]

[Pundit]: https://github.com/elabs/pundit