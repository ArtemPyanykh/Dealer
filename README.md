# Dealer

This package is dedicated to bringing game-theoretic utilities to `Wolfram Mathematica`. A huge goal it may (or may not) achieve.

For now, it provides capabilities for solving zero-sum matrix games in mixed strategies.  It is not big, but it is essential. If I'll have enough time, I could add some additional functionality.

## Setup
The first thing you need to do is install the package, and import it with:
    
    << Dealer`

Now try to do the following:
     
    Names["Dealer`*"] 
    
If you see at least

    {"NashEquilibrium"}
    
then you are ready to go!

## Usage
* NashEquilibrium[matrix] --- It should work with any matrix you pass to it. As a result you should get a three-element vector: value of the game, strategy over rows and strategy over columns respectively.
        
        In:= matrix = RandomReal[{-100, 100}, {5, 7}]
        In:= NashEquilibrium[matrix] // MatrixForm
        Out:= 
        (-13.5416
        {0.,0.,0.53248,0.46752,0.}
        {0.513836,0.,0.,0.,0.,0.,0.486164})
        
        
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request