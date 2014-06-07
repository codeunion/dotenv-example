# A dotenv Example

## Contents

1. [What is dotenv?](#what-is-dotenv)
2. [Getting Started](#getting-started)
3. [How dotenv works](#how-dotenv-works)
4. [Making git Ignore .env](#making-git-ignore-env)

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

At the top of our program, we need to tell the dotenv gem to load this while,
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
