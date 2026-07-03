# Project: Bubble Sort

## Introduction

We are going to implement the **bubble sort methodology** for our Ruby operations. We are going to use just numbers in this situation.

> [!NOTE]  
> We have to implement it. Avoiding the use of `#sort` method in this exercise.

### Basic Explanation

Bubble sort is a simple but higher resource consumer for sorting elements. The idea is simple: Just compare the numbers in pairs to see who is the greater and the lower and move positions if they do so.

### Basic Input/Output Testing

| **Input** | **Expected Output** |
|:---:|---|
| `[5, 1, 4, 2, 8]` | `[1, 2, 4, 5, 8]` |
| `[4, 3, 78, 2, 0, 2]` | `[0, 2, 2, 3, 4, 78]` |
| `[]` | `"Your list is empty!"` |
| `[4, 3, 'text', 2, 0, 2]` | `"Your list must have only numbers!` |

We have to make sure only numbers (could be *float*ing ones too) can be sorted by this algorithm. Making sure to do some validations for only numbers. Our array of numbers **shouldn't be empty** and validate if it's already sorted.

#### How to execute this in the terminal?

Open your terminal and go to your Ruby file and execute this:

```sh
ruby ./main.rb
```
