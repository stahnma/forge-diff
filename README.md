This is small and simple project to tell what's new on forge.

# Installation
Install the following gems.  No I will not include a Gemfile.


(Written in ruby, developed on 1.9.3, but it will probably work on 1.8.7)

* awesome_print
* httpary
* json

# Usage

Run forge_json_compare.rb.

This will create a file of modules.json.  Then the next time you run it, it will compare the last downloaded copy with the current copy, that's the hack and how diffs are generated.  The diff in JSON format is outputted to stdout.

Run summary.rb to get a more human-readable summary of what happened.

# Priming the diffs
I've included some older json files in the repo simply as a prime.  They reallly aren't very helpful.


# Patches
If you want to fix something, you should.


# License
Apache 2.0 License

