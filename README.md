# gpt-bash-cli

An extremely simple interface to the openai API, written in bash. Here's an example usage:

````
$ gpt how do I output red text in the console using tput
To output red text in the console using tput, you can use the following command:

```
tput setaf 1; echo "This text is in red"; tput sgr0
```

Explanation:

- `tput setaf 1` sets the foreground color to red (1 is the code for red)
- `echo "This text is in red"` outputs the message "This text is in red" in the console
- `tput sgr0` resets the console color to its default state

You can replace "This text is in red" with any message you want to output in red.
````

## Prerequisites

These scripts assume you have [`curl`](https://curl.se) and
[`jq`](https://stedolan.github.io/jq/) available.

## OpenAI API keys

You will need an OpenAI api key. Get one from
https://platform.openai.com/account/api-keys

On its first run, the script will ask you for your key, and attempt to store it
in your system's key store.

- On a mac, you shouldn't need to install anything. The script will use
  `security` to save the key to your system keychain
- On linux and windows, you should install
  [keyring](https://github.com/jaraco/keyring#installation---linux)

## Installation

There are two scripts in this repository, `gpt` and `gpti`. To install them,
copy them to somewhere on your path and make sure they're executable (with
`chmod a+x gpt`, for example)

**NOTE**: mac systems have a `gpt` binary installed in `/usr/sbin` by default.
Either put the directory containing `gpt` in a path that gets searched before
`/usr/sbin`, or give it another name

## Storage

Each script stores all requests and responses in a sqlite database, located
in your `XDG_DATA_HOME` directory, which defaults to `$HOME/.local/share`.

For most people the database will be located at
`~/.local/share/gpt-bash/openai.sqlite3`

## Usage

Each script has help output documenting all options.

### gpt

```
gpt [-vhp] [-m <model>] [-t <temperature>] <description>

chat with openai's /chat/completions endpoint

FLAGS:

    -h, --help: print this help and exit
    -m, --model: set the model you want to use. Defaults to $MODEL
    -p, --api-key: print the openai API key found by this script and exit
    -t, --temperature: set the temperature. Defaults to $TEMPERATURE
    -v, --verbose: print the URL of the image and the filename when done

STORAGE:

    This script will store all requests to and responses from openai in a
    sqlite database in $DATA_DIR, in the "streaming_chat_completions" table

EXAMPLE USAGE:

    gpt write a bash script that uses curl to access the openai API
```

### gpti

```
gpti [-vhp] <description>

generates an image via openai's /images/generations endpoint

FLAGS:

    -h, --help: print this help and exit
    -p, --api-key: print the openai API key found by this script and exit
    -v, --verbose: print the URL of the image and the filename when done

EXAMPLE USAGE:

    gpti a drone photo of fenway park on opening day

STORAGE:

    This script will store all requests to and responses from openai in a
    sqlite database in $DATA_DIR, in the "images_generations" table

NOTE:

    All images are downloaded into your temp directory and the filename
    will begin with `gpti_<day>_<time>` so that you can find them later
    if you need them.
```

## Examples

````
$ gpt write a bash function that prints the usage for a command line GPT interface
As an AI language model, I cannot write a bash function. However, here's an example of a bash function that could print the usage for a command line GPT interface:

```
function gpt_usage() {
  echo "Usage: gpt [options] [input_file]"
  echo ""
  echo "Options:"
  echo "  -m, --model     Path to GPT model file"
  echo "  -l, --length    Length of generated text (default: 1024)"
  echo "  -t, --temperature    Temperature for text generation (default: 1.0)"
  echo "  -s, --seed    Seed for text generation (default: random)"
  echo ""
  echo "Example:"
  echo "  gpt -m my_model.pt -l 500 -t 0.7 input.txt"
}
```

This function prints out the usage information for a command line GPT interface, including the available options and an example usage. The user can call this function by typing `gpt_usage` in the terminal.
````

![](images/fenway.png)

![](images/example1.png)
