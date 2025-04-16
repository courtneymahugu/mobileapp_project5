# Project 5 - *Trivia Game*

Submitted by: **Courtney Mahugu**

**Trivia Game** is an app that fetches trivia questions from the Open Trivia Database. The app allows users to customize their quiz by selecting the number of questions, category, difficulty, and type. It then presents the questions in a list format, where users can tap to select answers and submit to see their score.

Time spent: **4** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App launches to an Options screen where user can modify the types of questions presented when the game starts. Users should be able to choose:
  - [x] Number of questions
  - [x] Category of questions
  - [x] Difficulty of questions
  - [x] Type of questions (Multiple Choice or True False)
- [x] User can tap a button to start trivia game, this presents questions and answers in a List or Card view.
  - Hint: For Card view visit your FlashCard app. List view is an equivalent to UITableView in UIKit. Much easier to use!
- [x] Selected choices are marked as user taps their choice (but answered is not presented yet!)
- [x] User can submit choices and is presented with a score on trivia game
 
The following **optional** features are implemented:

- [ ] User has answer marked as correct or incorrect after submitting choices (alongside their score).
- [ ] Implement a timer that puts pressure on the user! Choose any time that works and auto submit choices after the timer expires. 

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

Here's a walkthrough of implemented user stories:

Here is a reminder on how to embed Loom videos on GitHub. Feel free to remove this reminder once you upload your README. 

[Guide]](https://www.youtube.com/watch?v=GA92eKlYio4) .

## Notes

Describe any challenges encountered while building the app.
- Struggled with crashes when decoding HTML from the API response using NSAttributedString. I replaced it with a custom string decoding extension to handle special characters safely.
- Struggled with tracking selected answers, required fixing the UUID to be stable across view updates using let id = UUID() in the model.

## License

    Copyright [2025] [Courtney Mahugu]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
