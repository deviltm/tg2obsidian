# tg2obsidian

[Russian](README.md).

## This is a **fork** of the [tg2obsidian](https://github.com/dimonier/tg2obsidian ) project

To run without a fix for the new version of the aiogram library, I added requirements.txt and Dockerfile to run on the server in a container.

Added the use of a template for the name of a future note, you can use three parameters date, time, title where:
Title - a cut-off part of the text of a message sent via telegram. It is truncated to 32 characters.
date - date in the DD-MM-YYYY format
time - in HH-MM-SS 24H format

Added a sanitizer for the file name created using a template and unique in parameters.

Fixed creation of photo and video file names.

Added the creation of a preview from each URL in the message text.

Improvements to the functionality and design will be directed towards compliance with the telegram-sync obsidian plugin.

All other improvements for yourself and friends will be in the issue. 

## Good luck to all, then the partially corrected text of the original readme.md

This program ("Bot") uses Telegram's free bot functionality in order to save messages from a Telegram group to the [Obsidian](https://obsidian.md) vault on your local computer.

The Markdown markup used will also work for most [other programs](https://www.markdownguide.org/tools/) that work with local Markdown files.

The Bot is designed to run locally on the computer where the Obsidian files are located.

## Use case

- You type, record, or forward messages to your personal Telegram group _on the go_
- Bot receives new messages from Telegram and saves them as Inbox notes in your PKM vault
- _Afterwards, in a quiet environment_, you process those notes, moving the information from them to appropriate places in your vault

## Features

- All messages are grouped by date — one note per day — or stored in a single note.
- Each message in a note has a header with a date and time stamp.
- Formatting of messages and captions is preserved or ignored depending on settings.
- For forwarded messages, information about the origin is added.
- Photos, animations, videos, and documents are saved to the vault and embedded in the note.
- For contacts, YAML front matter and vcard are saved.
- For locations, relevant links to Google and Yandex maps are created.
- It is possible to convert notes with certain keywords into a task.
- It is possible to tag notes with certain keywords.
- It is possible to recognize speech from voice notes and audio messages. In this case, the Bot sends the recognized text as a response to the original message.

## Set up

1. Install [Python](https://python.org) 3.10+
2. install script dependencies:

```shell
pip install aiogram=2.25.2
pip install beautifulsoup4=4.12.2
pip install lxml=4.9.3
```

3. Install [Whisper](https://github.com/openai/whisper) and Pytorch modules if you need voice messages get recognized to text:

```shell
pip install -U openai-whisper
pip install torch
```

4. Install compiled [FFMPEG](https://ffmpeg.org/download.html) and add the path to the executable (in Windows — ffmpeg.exe) to the `path` environment variable. Go to the folder containing this script and make sure that `ffmpeg.exe` could be started there.
5. Create your own bot using https://t.me/BotFather
6. Paste the token received from `@botfather` into the appropriate parameter in `config.py` and change the rest of the parameters in `config.py` as desired.
7. (Optional) Add the bot created above to a private Telegram group and make it administrator so it can read messages.

## Usage

1. Send or forward messages that should go to your Obsidian vault to the private Telegram group or directly to your Telegram bot.

2. Run Bot:
```shell.
python tg2obsidian_bot.py
```

- You can keep Bot running indefinitely on a computer or server that is permanently turned on. In this case, it will recognize speech and create/update notes in Obsidian in real time.
- If you only turn your computer on when you're using it, run Bot directly when you need to get Obsidian messages, and close the program when you've received all the messages.

**Important!** Bot can only retrieve messages for the last 24 hours. Messages sent earlier and not retrieved in a timely manner will not be received by Bot and saved in the vault.

## Additionally added

added dockerfile to create a container
```
docker build . -t tg2obsidian:latest

docker run -itd --name testbot -v <yourpath>/config.py:/code/config.py -v <yourpath>:<configpath> -v <yourpath>/bot.log:/code/bot.log tg2obsidian:latest
you can use an already assembled image

docker.io/deviltm/tg2obsidian:latest
```
