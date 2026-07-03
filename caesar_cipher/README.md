# Project: Caesar Cipher

## Introduction

Julius Caesar uses this technique in his secret letters to encrypt the messages. Now we are going to implement his original technique in Ruby!

### Basic Explanation

Basically, we are going to use a string: `"Hello"` and use Caesar cipher and count down each letter of the string. Say, the `key = 3` will counting down from the alphabet.

- `"H" - 3` -> `"K"`
- `"e" - 3` -> `"h"`
- `"l" - 3` -> `"o"`
- `"l" - 3` -> `"o"`
- `"o" - 3` -> `"r"`

So, the final result will be: `Khoor` (what a cool result, uh? **I did not expected that one too**)

> [!NOTE]  
> This exercise requires shifting to the **right**, not to the left.

### Basic Input/Output Testing

|           **Input**          |    **Expected Output**    |
|:----------------------------:|:-------------------------:|
| `'Hello'`                    | `"Khoor"`                 |
| `'What a beautiful day!', 2` | `"Yjcv c dgcwvkhwn fca!"` |
| `'Y', 2`                     | `"A"`                     |
| `'', 5`                      | `""`                      |
| `'Y', -2`                    | `"B"`                     |

The number after the comma is the `shift factor`. By default, we declare the shift factor as `3`. The **USER** should be able to enter data from the *console/terminal* if possible.

Also, we have to validate for negative and zero numbers. Only we have to permit positive numbers (*and not so much such as 28, 29, 1000, etc.*)

#### How to execute this in the terminal?

Open your terminal and go to your Ruby file and execute this:

```sh
ruby ./main.rb
```
