/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR coins = 0
VAR my_name = ""


->memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Waffles] 
~ pet_name = "Charlie"
-> name

* [Bops] 
~ pet_name = "Bops"
-> name

* [Blooper]
~ pet_name = "Blooper"
-> name

== name ==
What's your name?

* [John]
~ my_name = "John"
-> cave_mouth

* [Sarah]
~ my_name = "Sarah"
-> cave_mouth

* [Charlie]
~ my_name = "Charlie"
-> cave_mouth


-> cave_mouth


== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

{not cave_mouth: You made it to the cave. If only {pet_name} could see you now!| }

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
+ {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Bops" : Bops would love it here in the west| } 
+ {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
* Go Back -> cave_mouth
+ {not take_coins}[Take Coins] -> take_coins
+ {weird_door}[Take more coins] -> take_more_coins

== take_coins ==
~ coins = coins + 1
You grab a coin from the thousands of coins in the room.
+ [Go Back] -> east_tunnel_lit
+ [Take more] -> take_more_coins

== take_more_coins
{weird_door: You grab 4 more to make up the amount needed| }
{not weird_door: You're a bit greedy and grab some more| }
~ coins = coins + 4
+ [Go Back] -> cave_mouth


-> END

== west_tunnel_lit ==
The lit tunnel is empty, but at end of the tunnel you see something that looks like a door.
+ [Go closer] -> weird_door
+ [Go back] -> cave_mouth

== weird_door ==
The door has some type of picture on it, but you don't understand what it means. Instead 5 small round indents on the ground catches your eye. It seems to open this door you need to fill the whole with something.
{east_tunnel_lit: You remember the coins in the east tunnel. They look like the perfect size.}
+ {coins == 5} Place the five coins in the grove -> entered_door
+ [Go Back] -> cave_mouth
+ {not east_tunnel} Explore -> cave_mouth

== entered_door ==
A space filled with more treasure than what you saw in the east tunnel fills your vision. What suprised you most was, your entire family was waiting for you at the end. Your mother calls out to you " {my_name} did you like the suprise we prepared? "
-> END


















