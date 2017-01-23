# Bank Tech Test

## Brief
Create an app, usable though a REPL, that implements a very-much-simplified banking interface:

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## User Stories

```
As a user,
So that I can know how much money I have
I want to see my bank account balance

As a user,
So that I am sure the bank got my money,
I want to see my account balance go up when I deposit money

As a user,
So that I am confident about how much money I have left,
I want to see my account balance go down when I withdraw money

As a user,
So that my transactions make sense to me,
I want to see the most recent transactions on my account first.
```

## How to Install
Clone this repo to your computer and run `bundle` in the project directory.

## Getting Started
Run `ruby bank.rb`. This file includes all the necessary application files, and will launch [pry](https://github.com/pry/pry) so that you can start playing around.

A suggested starting point is:

```
account = Account.new
account.deposit(1000)
```

## Approach
This application consists of 3 classes:

* Account - management class, which controls the user interactions between their balance, and making statements
* Transaction - a log of user activity (deposits and withdrawals)
* StatementFormatter - takes the log of transactions and formats it into a table on the command line.

Dependency injection has been heavily used to allow for isolated testing. However, to make things slightly easier for the user, default dependency values have been supplied. This means that the user is able to type `account.deposit(1000)` as one would expect, instead of `account.deposit(1000, Transaction)`.

RSpec was used for testing.
