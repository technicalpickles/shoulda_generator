# Shoulda generators

One night at a Boston Ruby hackfest, I finally got sick of using the Rails default generators, and then having to twiddle them to meet my needs and tastes. This includes using things like:

 * [shoulda](http://thoughtbot.com/projects/shoulda)
 * [factory\_girl](http://github.com/thoughtbot/factory_girl)
 * [haml](http://haml.hamptoncatlin.com/)
 * [blueprint](http://code.google.com/p/blueprintcss/)

The next morning, I was struck awake at 5am with the inspiration to start implementing it. shoulda\_generator is the result of this effort.

## What you get

### shoulda\_model

 * A new model
 * A migration for the model
  * Skip using --skip-migration
 * A factory defined with [factory_girl](http://github.com/thoughtbot/factory_girl)
  * Skip using --skip-factory
 * A [shoulda](http://thoughtbot.com/projects/shoulda) unit test with a few simple 'should's

#### Prereqs:

 * [shoulda](http://thoughtbot.com/projects/shoulda) installed as a plugin
 * [factory\_girl](http://github.com/thoughtbot/factory_girl) gem installed
 * [factory\_girl\_on\_rails](http://github.com/technicalpickles/factory_girl_on_rails) installed as a plugin

### shoulda\_scaffold

 * Everything included in shoulda_model
 * A controller (sans unnecessary comments)
 * Choice of [haml](http://haml.hamptoncatlin.com/) (default) or ERB 
   * Specify which with the --templating option
 * Simple layout styled with blueprint
   * Skip using --skip-layout
 * A helper
 * A shoulda functional test using factory_girl factory, using should\_be\_restful or not
   * Specify with --functional-test-style, accepts basic and should\_be\_restful

#### Prereqs:

 * [shoulda](http://thoughtbot.com/projects/shoulda) installed as a plugin
 * [factory\_girl](http://github.com/thoughtbot/factory_girl) gem installed
 * [factory\_girl\_on\_rails](http://github.com/technicalpickles/factory_girl_on_rails) installed as a plugin
 * [haml](http://haml.hamptoncatlin.com/) gem installed on the system, and the project has been hamlified using  `haml --rails`

## Getting it

shoulda\_generator is available as a gem via [GitHub](http://github.com). If you haven't done so already, you need to setup GitHub as a gem source:

    $ gem sources -a http://gems.github.com
    
Now you can install it:
    
    $ sudo gem install technicalpickles-shoulda_generator

## Example usage

Usage is the same as the default Rails generators.

    $ script/generate shoulda_model post title:string body:text published:boolean 
    $ script/generate shoulda_scaffold post title:string body:text published:boolean


## Configuring it

You can override the default values for templating and functional\_test\_style by placing a .shoulda\_generator  file in your home directory.

Here's an example `.shoulda_generator`:

    :templating: erb              # supported options: haml|erb
    :functional_test_syle: basic  # supported options: should_be_restful|basic

## Developing it

Source is hosted on GitHub: [http://github.com/technicalpickles/shoulda_generator/tree/master](http://github.com/technicalpickles/shoulda_generator/tree/master)

You can do the usual fork/commit cycle until you have something ready to share. Send pull requests my way.