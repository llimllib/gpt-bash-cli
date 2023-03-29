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

These scripts assume you have `curl` and `jq` available.

## OpenAI API keys

You will need an OpenAI api key. Get one from
https://platform.openai.com/account/api-keys

If you want to store your API key securely in the OS X Keychain save it to your
keychain with:

```bash
security add-generic-password -s 'openai' -a '<account name>' -w '<api key>'
```

If you do so, these scripts will pull your API key out of your keychain.

Alternately, edit each script and set `OPENAIKEY` at the top to the value of
your key.

## Installation

There are two scripts in this repository, `gpt` and `gpti`. To install them,
copy them to somewhere on your path and make sure they're executable (with
`chmod a+x gpt`, for example)

## Examples

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

![](images/example1.png)
