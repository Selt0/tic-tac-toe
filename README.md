# **Tic Tac Toe**

Play tic tac toe in ruby!

There are a total of 3 versions.

| Version | Description                                                                    |
| ------- | ------------------------------------------------------------------------------ |
| 1       | Basic 3x3 grid with two players. (Standard tic tac toe game                    |
| 2       | Dynamic grid with two or more players                                          |
| 3       | Play against the AI (Not the brightest). Dynamic grid with two or more players |

### **How to play:**

_Version 1_:

```ruby
  game = Game.new(:X, :O)
  game.run
```

Use any symbol of your choice!

---

_Version 2_

```ruby
  game = Game.new(6, :H, :E, :L, :L, :O)
  game.run
```

Enter any number to represent the size of the grid.
n x n

Enter as many symbols as you wish to represent players

---

_Version 3_

```ruby
  machine_war = Game.new(10, h: true, u: true, e: true)
  machine_war.run
```

Enter any number to represent the grid

Enter any character followed by a colon and 'true' or 'false'

true = computer

false = player

---

Have fun!

_P.S I will try to learn how to make the game into [**ultimate tic tac toe**](https://en.wikipedia.org/wiki/Ultimate_tic-tac-toe)_

_...And also a smarter AI :D_
