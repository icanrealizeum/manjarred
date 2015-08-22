fn main() {
    println!("Hello, world!");

    //you can match against literals directly, and _ acts as an any case:
    let x = 3;
    match x {
        1 => println!("one"),
        2 => println!("two"),
        3 => println!("three"),
        _ => println!("anything"),
    }

    //You can match multiple patterns with |:
    let x = 2;
    match x {
        1 | 2 => println!("one or two"),
        3 => println!("three"),
        _ => println!("anything"),
    }

    //You can match a range of values with ...:
    //Ranges are mostly used with integers and single characters.
    let x = 4;
    match x {
        1 ... 5 => println!("one through five"),
        _ => println!("anything"),
    }

    //If you're matching multiple things, via a | or a ..., you can bind the value to a name with @:
    let x = 6;
    match x {
        e @ 1 ... 5 => println!("got a range element {}", e),
        e @ 6 => println!("got a 6, {}", e),//can have same e, no conflicts(makes sense actually)
        _ => println!("anything"),
    }

    //If you're matching on an enum which has variants, you can use .. to ignore the value and type in the variant:
    enum OptionalInt {
        Value(i32),
        Missing,
    }
    let x = OptionalInt::Value(5);
    match x {
        OptionalInt::Value(..) => println!("Got an int!"),
        OptionalInt::Missing => println!("No such luck."),
    }

    //You can introduce match guards with if:
    let x = OptionalInt::Value(5);

    match x {
        OptionalInt::Value(i) if i > 5 => println!("Got an int bigger than five!"),
        OptionalInt::Value(..) => println!("Got an int!"),
        OptionalInt::Missing => println!("No such luck."),
    }

    //If you're matching on a pointer, you can use the same syntax as you declared it with. First, &:
    let x = &5;
    match x {
        &val => println!("Got a value: {}", val),
    }
    //Here, the val inside the match has type i32. In other words, the left-hand side of the pattern destructures the value. If we have &5, then in &val, val would be 5.

    //If you want to get a reference, use the ref keyword:
    let x = 5;
    match x {
        ref r => println!("Got a reference to {} {:p} {} {:p}", r, r,x,&x),
    }
    //Here, the r inside the match has the type &i32. In other words, 
    // !!! the ref keyword creates a reference, for use in the pattern. !!!

    //If you need a mutable reference, ref mut will work in the same way:
    let mut x = 5;
    match x {
        ref mut mr => {
            println!("Got a mutable reference to {}", mr); 
            *mr=6
        },
    }
    println!("after: {}",x);

    //If you have a struct, you can destructure it inside of a pattern:
    struct Point {
        x: i32,
        y: i32,
    }

    let origin = Point { x: 1, y: 2 };
    match origin {
        Point { x: x, y: y } => println!("({},{})", x, y),
    }

    //If we only care about some of the values, we don't have to give them all names:
    match origin {
        Point { x: x, .. } => println!("x is {}", x),
    }
    match origin {
        Point { y: y, .. } => println!("y is {}", y),
        //Point { .., y: y } => println!("y is {}", y), // this won't work
    }


    //If you want to match against a slice or array, you can use []:
    let v = vec!["match_this", "1"];
    match v.as_slice() {
        ["match_this", second] => println!("The second element is {}", second),
        _ => {},
    }
}
