# A dotenv Example

## Contents

1. [What is dotenv?](#what-is-dotenv)
2. [Getting Started](#getting-started)
3. [How dotenv works](#how-dotenv-works)
4. [Making git Ignore .env](#making-git-ignore-env)
5. [Other Solutions to The "Sensitive Information" Problem](#other-solutions-to-the-sensitive-information-problem)

## What is dotenv?

The [dotenv gem](https://github.com/bkeepers/dotenv) makes it easy to load
project-specific environment variables.  This means we won't have to mess with
system configuration files in order to store things as environment variables
in our local development environment.

Remember, we want to store sensitive information like usernames, passwords,
and access tokens as environment variables for a few reasons:

1. We don't want other people to see this information in our code on GitHub
2. If someone else wants to use our code, e.g., a teammate, they will have to
   change the environment-specific information anyhow.

## Getting Started

To get started

1. Fork this repository if you want your own copy to play with
2. Clone this repository (or your fork) onto your local computer
3. In the `dotenv-example` directory, run

   ```
   bundle install
   ```

   to install the necessary gems.
4. Run

   ```
   ruby example.rb
   ```

   and see what happens. :)

Don't be afraid to read the contents of [example.rb](example.rb) and [.gitignore](.gitignore)!

## How dotenv Works

dotenv relies on you creating a `.env` file in the root directory of your
project.  It might look like this:

**Example `.env` file**:

```text
TWITTER_API_KEY="my-twitter-api-key"
TWITTER_API_SECRET="my-twitter-api-secret"

GITHUB_ACCESS_token="my-github-access-token"
```

**Note**: Environment variables don't *need* to be given names in all caps,
but that's the convention. You will throw other people off if you don't follow
the same convention.

At the top of our program, we need to tell the dotenv gem to load the .env file,
which we do like so:

```ruby
# This is your main program file

# Load the dotenv gem
require 'dotenv'

# This tells dotenv to read the .env file and set the appropriate values in ENV
Dotenv.load

# Assuming we used the example .env file above, ENV['TWITTER_API_SECRET'] should
# now contain the string "my-twitter-api-secret".

puts ENV['TWITTER_API_SECRET']
```

## Making git Ignore .env

At first glance, this doesn't really solve our problem.  Sure, the sensitive
information is now stored in a `.env` file instead of being hard-coded into
our Ruby program, but if we commit the `.env` file we're back at square one.

Fortunately, it's possible to tell git to *ignore* certain files in the current
directory. Each line in the `.gitignore` file describes a file, directory, or
set of files that git should ignore.

See our [example .gitignore file](.gitignore).

### What does "ignore" mean?

"Ignore" means git will really, *really* ignore the file.  You couldn't commit a
file whose name was in `.gitignore` even if you tried.  Git will treat the file
as if it simply didn't exist.

## Other Solutions to The "Sensitive Information" Problem

In every case, every solution to the "sensitive information" problem follows the
same fundamental pattern:

1. Separate your sensitive information from your program
2. Have your program load the file with sensitive information
3. Tell git to ignore that file

That said, dotenv isn't the only solution to this problem.  There
are other gems like [figaro](https://github.com/laserlemon/figaro) which do
much the same thing, for example.

If you don't want to or can't use a gem to separate sensitive information from
your project, there are a few other options.  A common pattern is to create a
configuration file in an easy-to-ready format like [YAML](http://en.wikipedia.org/wiki/YAML)
called, say, `credentials.yml`.  You would then store sensitive information in
that file and add that file to `.gitignore`, so that you couldn't accidentally
push it up to GitHub or otherwise reveal its contents.

You'd have to write your own code to load the file, although in the case the Ruby standard library comes with a [a library to parse YAML](http://ruby-doc.org/stdlib-2.0.0/libdoc/yaml/rdoc/YAML.html).

The nice thing about using environment variables is that they use a standard
interface available to *any* program and can be changed without modifying
a file in an idiomatic, project-specific format.
