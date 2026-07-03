# Project: Sub Strings

## Introduction

Validation dictionary words with your current string to count how many times some of your words appears in the dictionary.

### Basic Explanation

You have your string of words, maybe one word or a complete sentence. Now we have to figure out from our dictionary how many times some of our string of words appears in the dictionary.

#### Example

- You have this *simple sentence*: `'going'`
- Now, you have this literal *array of strings*: `["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]`
- Call your *method* `#substrings` and we have to see if `'going'` appears in the array (dictionary)
- The excepted output should be: `["go", "going"]`. And return a new **hash** of *sub-strings*, which showing the words that appear and the quantity.

> [!NOTE]  
> It does not matter if we use upper case or lower case. The text you use would be **case insensitive** for these operations.

### Basic Input/Output Testing

This is the actual `dictionary` content: `below down go going horn how howdy it i low own part partner sit`.

| **Input** | **Excepted Output** |
|:---:|:---:|
| `'going', dictionary` | `{"go"=>1,"going"=>1}` |
| `'below', dictionary` | `{"below"=>1,"low"=>1}` |
| `'Howdy partner, sit down! How's it going?', dictionary` | `{"down"=>1,"go"=>1,"going"=>1,"how"=>2,"howdy"=>1,"it"=>2,"i"=>3,"own"=>1,"part"=>1,"partner"=>1,"sit"=>1}` |
| `'text', dictionary` | `{}` |

#### How to execute this in the terminal?

Open your terminal and go to your Ruby file and execute this:

```sh
ruby ./main.rb
```
