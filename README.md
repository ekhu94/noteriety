# Noteriety

Based on the Cornell Notes system introduced by Walter Pauk in the 1940s, Noteriety utilizes the iconic "two-column" method, which divides your note-taking between main content and key points. Regardless of whether or not you're a natural note taker, it can be challenging for anyone to consistently organize their thoughts during a lecture or just everyday life. Diligently writing things down is only half the process: your notes must clearly address the key take-aways in an easy-to-read format.

Noteriety not only makes it easy to write notes, it also allows you to review past notes in an organized and efficient manner. Notes can be divided up into subjects of your choice with the ability to revisit entries in a particular category as well as search for specific topics. When creating a new note, you will write a summary at the end detailing what you've learned, what key points to remember, and any potential questions you may still have. Notes here are MEANT to be constantly revisited and changed.

I created this website to be a simple, modest environment where thoughts can be organized. In time, organized thoughts lead to habits that lead to life-long disciplines. Whether you're a driven college student, avid writer, or simply looking for a place to jot down recipe ideas, Noteriety provides a pleasant workspace for you to manage your ideas, ask insightful questions, and reinforce your learning process.

## Installation

### Clone the repository from [Github](https://github.com/ekhu94/noteriety).

```bash
git clone git@github.com:ekhu94/noteriety.git
```

### Check your ruby version with ```ruby -v```.

You should be switched to version ```2.7.1``` You can install the correct ruby version using [rbenv](https://github.com/rbenv/rbenv).

```bash
rbenv install 2.7.1
```

### Install dependencies and run migrations

Run [Bundle](https://github.com/rubygems/bundler) and [Yarn](https://github.com/yarnpkg/yarn). This may take a while.

```bash
bundle && yarn
```

Once dependencies are installed, use ```rails db:migrate``` to generate active record migrations.

## Serve

Run ```rails s``` in the terminal to start the server. If you are a first-time user, fill out the form on the ```Sign Up``` page.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
